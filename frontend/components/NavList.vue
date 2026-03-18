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
  overlayTitle: 'Navigation',
})

const navRef = ref<HTMLElement | null>(null)
const overlayRef = ref<HTMLElement | null>(null)
const navTimeline = ref<gsap.core.Timeline | null>(null) // create component-level timeline to be able to control it from outside the navTransition function to reverse it when closing the nav

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

const closeNav = () => {
  navTimeline.value?.reverse()
}

const isVisible = computed(() => {
  return layout.value.openOverlay.navigation
})

// use composable to stop the body from scrolling when overlay is open. also resets the overflow on unmount and deactivated
htmlOverflowLock(isVisible)

const resetAnimationState = (elements: Element[]) => {
  gsap.set(elements, {
    clearProps: 'transform,opacity,visibility',
  })
}

const navTransition = () => {
  const overlay = overlayRef.value
  const nav = navRef.value
  if (!overlay || !nav) return

  const items = nav.querySelectorAll('.nav-item')
  const subItems = nav.querySelectorAll('.sub-nav-item')

  // before starting a new transition and assigning start variables and settings, clear all used props from prev transition to prevent issues with manipulated DOM state, esp. after breakpoint changes -> leads to stale values left inline like x or y values etc. only clear props that are used in transition to prevent issues with other styles.
  // one reset function to reset items and sub-items upon (re)creation of transition. everything clean from here on.
  resetAnimationState([...items, ...subItems])

  // define variables and settings for transition here to be able to maintain them much easier
  const overlayDuration = 0.25 // same as short in variables.css
  const navDuration = 0.4
  const subNavDuration = 0.25
  const staggerDelay = 0.06
  const animationPosition = '<0.15'
  const yPosition = -15
  const easing = 'power2.out'
  // kill any existing timeline instance before creating a new one to prevent issues and keep code and lifecycles clean
  navTimeline.value?.kill()
  // create timeline to which to add all the animations for sequencing nicely without tedious delays etc.
  // use local timeline and pause it immediately. controls like start and reverse will happen on component level with navTimeline ref
  const timeline = gsap.timeline({
    paused: true,
    // only when the reverse transition is fully finished, use the callback to set the store value to close the nav. setting the store value to false too early causes the nav to be removed from the DOM before the leaving transition is finished, therefore interrupting the transition -> causes unwanted behaviour.
    // callback is set here in the timeline config, no need to use it as callback for a specific animation cuz whole timeline will be reversed no matter which screen size. and is ONLY called once reverse is fully finished. cleanest and safest approach to properly sequence closing and transition.
    onReverseComplete: () => {
      layout.value.openOverlay.navigation = false
    },
  })

  // assign local timeline value to component-level ref to enable control from outside the navTransition function
  navTimeline.value = timeline

  // to: from wherever you are TO this state
  // from: FROM this state to DOM state (entering transitions). sets start values immediately, then animates to defined state. can cause flickers, therefore set() and to() can be used (gsap.set(items, { opacity: 0, x: -40 })) to set start values immediately without animation, then use to() to animate to DOM state. this is the cleanest approach to avoid flickers and have better control over the transition.
  // fromTo: FROM this state TO this state (entering and leaving transitions)

  // OVERLAY:
  // set initial state to start transition from for overlay to avoid issues with manipulated initial DOM state cuz otherwise, DOM stays invisible after first transition run
  gsap.set(overlay, { autoAlpha: 0 })
  // define overlay transition start point to end at DOM state and add it to the timeline as the first transition.
  timeline.to(overlay, {
    autoAlpha: 1,
    duration: overlayDuration,
    ease: easing,
  })

  // NAV ITEMS:
  if (isMedium.value) {
    // MEDIUM: transition columns AND their children

    // set initial state (upon creating or after reset on watch) to start transition from for items to avoid issues with manipulated initial DOM state cuz otherwise, DOM stays invisible after first transition run
    gsap.set(items, { autoAlpha: 0, x: -20 })
    // define nav-items transition start point to end at DOM state and add it to the timeline as the first transition.
    timeline.to(
      items,
      {
        autoAlpha: 1,
        // x: (i, el) => -el.offsetWidth // use function-based values to adress each item individually. works just like a loop.

        x: 0,
        stagger: staggerDelay,
        ease: easing,
        duration: navDuration,
      },
      animationPosition,
    ) // https://gsap.com/resources/position-parameter: start this transition 0.15 seconds after the start of the previous one for a smoother ease out effect

    // if there are sub-items, get each one of them and animate them with a slight delay after their parent item for a staggered effect
    items.forEach((i) => {
      if (!subItems.length) return

      // set initial state (upon creating or after reset on watch) for sub-items to start transition from to avoid issues with manipulated initial DOM state cuz otherwise, DOM stays invisible after first transition run
      gsap.set(subItems, { autoAlpha: 0, y: yPosition })

      timeline.to(
        subItems,
        {
          y: 0,
          autoAlpha: 1, // animates opacity and visibility. when autoAlpha is 0, it sets visibility to hidden to prevent clicks on invisible items, and when it animates to a visible state, it sets visibility to visible. this prevents the need to set pointer-events: none for invisible items in CSS.
          duration: subNavDuration,
          ease: easing,
          stagger: staggerDelay, // delay per item (row) in s
        },
        i * 0.15 + 0.15, // index * delay for each parent item creates progressive delay per column (column rhythm) + delay after parent item animation starts (when children start appearing). currently waits till parent item animation is finished (0.5s) to calm the animation a bit
      )
    })
  } else {
    // SMALL: stagger of nav list without children

    // set initial state (upon creating or after reset on watch) for items to start transition from to avoid issues with manipulated initial DOM state cuz otherwise, DOM stays invisible after first transition run. cannot be the same as medium breakpoint because of different animation (opacity and x vs autoAlpha and y).
    gsap.set(items, { autoAlpha: 0, y: yPosition })

    timeline.to(items, {
      y: 0,
      autoAlpha: 1,
      stagger: staggerDelay,
      ease: easing,
      duration: navDuration,
    })
  }
}

watch(isVisible, (visible) => {
  if (visible) {
    // if nav is visible through isVisible (based on store value), start its transition. create a new transition instance everytime isVisible = true. this is fine and the desired way cuz the transition depends on state (breakpoints) and is complex. therefore, creating (and killing) the instance is the cleanest way to make sure the transition always runs with the correct settings based on the current state.
    navTransition()
    navTimeline.value?.play()
  }

  // reset all inline style set by GSAP on breakpoint change to prevent issues with manipulated DOM state and stale values left inline like x or y values etc. that would cause the nav to be invisible after the first transition run and breakpoint change. only reset styles that are used in the transition to prevent issues with other styles.
  watch(isMedium, () => {
    // if nav not visible or ref not defined do nothing
    if (!isVisible.value) return
    if (!navRef) return

    // fetch all relevant (both depths necessary cuz both are manipulated at some point by the transition) items at once
    const all = navRef.value.querySelectorAll('.nav-item, .sub-nav-item')
    // and reset their inline styles set by GSAP so that the set() and to() cascade works again
    gsap.set(all, {
      clearProps: 'transform,opacity,visibility',
    })
  })
})
</script>

<template>
  <nav v-show="isVisible" ref="overlayRef" class="nav" aria-label="Navigation">
    <CloseButton
      :overlay-title="labels.overlayTitle"
      class="close"
      @click="closeNav"
    />
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
  display: grid;
  grid-template-rows: auto 1fr auto; /* close button, nav items, legal */
  width: 100%;
  height: 100%;
  padding: var(--gutter-m) var(--gutter-s);
  background-color: var(--white-90);
  backdrop-filter: blur(var(--bg-blur));

  // always use $tablet as a "working breakpoint" to be able to change explicit widths later and not needing to change them in the whole app.
  @media (min-width: $tablet) {
    padding: var(--gutter-m);
  }
}

.close {
  padding-right: 0; // reset default padding of CloseButton.vue
}

.nav-list {
  @include list-reset;

  padding-top: var(--gutter-l);

  @media (min-width: $tablet) {
    display: flex;
    justify-content: space-between;
    max-width: 100%;
    padding-right: calc(var(--gutter-base) * 5);
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
