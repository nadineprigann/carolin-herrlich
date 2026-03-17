<script lang="ts" setup>
import { gsap } from 'gsap'
import { htmlOverflowLock } from '@/composables/useHtmlOverflowLock'

const defaultsStore = useDefaultsStore()
const { defaults } = storeToRefs(defaultsStore)
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)
const breakpointsStore = useBreakpointsStore()
const { isMedium } = storeToRefs(breakpointsStore)

const blogChildren = [
  {
    name: 10001,
    meta: {
      id: 10001,
      template: 'blog-all',
      title: 'Alle',
      url: { path: '/blog', hash: '#alle' },
    },
    path: '/blog#alle',
  },
  // {
  //   name: 10002,
  //   meta: {
  //     id: 10002,
  //     title: 'Archiv',
  //     url: { path: '/blog', hash: '#archiv' },
  //     template: 'blog-archive',
  //   },
  //   path: '/blog#archiv',
  // },
]

const labels = reactive({
  imprint: 'Impressum',
  privacy: 'Datenschutz',
})

const navRef = ref<HTMLElement | null>(null)
const overlayRef = ref<HTMLElement | null>(null)

const excludedTemplates = ['home', 'tool', 'project', 'blog-post', 'event']

const visibleRoutes = computed(() =>
  defaults.value.navigation
    .filter((item) => !excludedTemplates.includes(item.meta.template))
    .map((item) => {
      if (item.meta.template === 'blog') {
        return {
          ...item,
          children: blogChildren,
        }
      }
      return item
    }),
)

const handleToggleSubNav = (id: number) => {
  layout.value.currentSubNav = layout.value.currentSubNav === id ? null : id
}

const openImprintOverlay = () => {
  layout.value.openOverlay.imprint = true
}

const openPrivacyOverlay = () => {
  layout.value.openOverlay.privacy = true
}

const isVisible = computed(() => {
  return layout.value.openOverlay.navigation
})

// use composable to stop the body from scrolling when overlay is open. also resets the overflow on unmount and deactivated
htmlOverflowLock(isVisible)

const navTransition = () => {
  const overlay = overlayRef.value
  const nav = navRef.value
  if (!overlay || !nav) return

  const items = nav.querySelectorAll('.nav-item')
  const overlayDuration = 0.3
  const navDuration = 0.5
  const animationPosition = '<0.15'
  const yPosition = -15
  // create timeline to which to add all the animations for sequencing nicely without tedious delays etc.
  const timeline = gsap.timeline()
  // to: from wherever you are TO this state
  // from: FROM this state to DOM state (entering transitions). sets start values immediately, then animates to defined state. can cuase flickers, therefore set() and to() can be used.
  // fromTo: FROM this state TO this state (entering and leaving transitions)

  // set initial state for all items to be invisible and slightly moved to the left. this is important for the entering transition, as the items are already in the DOM when the transition starts, but should start from this defined state. otherwise they would be visible and in their final position for a split second before the transition starts, which causes a flicker.
  // gsap.set(items, { opacity: 0, x: -40 })

  // define overlay transition start point to end at DOM state and add it to the timeline as the first transition.
  timeline.from(overlay, {
    opacity: 0,
    duration: overlayDuration,
    ease: 'power2.out',
  })

  if (isMedium.value) {
    // MEDIUM: transition columns AND their children
    // define nav-items transition start point to end at DOM state and add it to the timeline as the first transition.
    timeline.from(
      items,
      {
        opacity: 0,
        // x: (i, el) => -el.offsetWidth // use function-based values to adress each item individually. works just like a loop.

        x: -60,
        stagger: 0.1,
        ease: 'power2.out',
        duration: navDuration,
      },
      animationPosition,
    ) // https://gsap.com/resources/position-parameter: start this transition 0.15 seconds after the start of the previous one for a smoother ease out effect

    // if there are sub-items, get each one of them and animate them with a slight delay after their parent item for a staggered effect
    items.forEach((item, i) => {
      const subItems = item.querySelectorAll('.sub-nav-item')
      if (!subItems.length) return

      timeline.from(
        subItems,
        {
          y: yPosition,
          autoAlpha: 0, // animates opacity and visibility. when autoAlpha is 0, it sets visibility to hidden to prevent clicks on invisible items, and when it animates to a visible state, it sets visibility to visible. this prevents the need to set pointer-events: none for invisible items in CSS.
          duration: navDuration,
          ease: 'power2.out',
          stagger: 0.06, // delay per item (row) in s
        },
        i * 0.18 + navDuration, // index * delay for each parent item creates progressive delay per column (column rhythm) + delay after parent item animation starts (when children start appearing). currently waits till parent item animation is finished (0.5s) to calm the animation a bit
      )
    })
  } else {
    // SMALL: stagger of nav list without children
    timeline.from(
      items,
      {
        y: yPosition,
        autoAlpha: 0,
        stagger: 0.1,
        duration: navDuration,
      },
      animationPosition,
    )
  }
}

watch(isVisible, (visible) => {
  if (visible) {
    // if nav is visible through isVisible (based on store value), start its transition. nextTcik to make sure all items are fully attached to the DOM.
    navTransition()
  }
})
</script>

<template>
  <nav v-show="isVisible" ref="overlayRef" class="nav" aria-label="Navigation">
    <ul ref="navRef" class="nav-list">
      <NavItem
        v-for="item in visibleRoutes"
        :key="item.name"
        :item="item"
        @toggle-sub-nav="handleToggleSubNav"
      />
    </ul>
    <section class="legal">
      <button type="button" class="button">
        <FieldText
          element="span"
          class="label"
          :text="labels.imprint"
          aria-label="Impressum"
          @click="openImprintOverlay"
        />
      </button>
      <button type="button" class="button">
        <FieldText
          element="span"
          class="label"
          :text="labels.privacy"
          aria-label="Datenschutz"
          @click="openPrivacyOverlay"
        />
      </button>
    </section>
  </nav>
</template>

<style lang="scss" scoped>
.nav {
  position: fixed;
  top: 0;
  left: 0;
  z-index: var(--xl-overlay);
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  width: 100%;
  height: 100%;
  padding: calc(var(--gutter-base) * 5) var(--gutter-m) var(--gutter-base)
    var(--gutter-m);
  background-color: var(--white-90);
  backdrop-filter: blur(var(--bg-blur));

  // always use $tablet as a "working breakpoint" to be able to change explicit widths later and not needing to change them in the whole app.
  @media (min-width: $tablet) {
    padding: calc(var(--gutter-base) * 6) var(--gutter-m) var(--gutter-m)
      var(--gutter-m);
  }
}

.nav-list {
  @include list-reset;

  @media (min-width: $tablet) {
    display: flex;
    justify-content: space-between;
    max-width: 100%;
    padding-right: calc(var(--gutter-base) * 10);
  }
}

.legal {
  display: flex;
  justify-content: space-between;
}

.button {
  &:first-of-type {
    margin-right: calc(var(--spacing-m) * 2);
  }
}

.label {
  @include ff-sans;
  @include fs-small;
}
</style>
