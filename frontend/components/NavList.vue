<script lang="ts" setup>
import { htmlOverflowLock } from '@/composables/useHtmlOverflowLock'

const defaultsStore = useDefaultsStore()
const { defaults } = storeToRefs(defaultsStore)
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

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
</script>

<template>
  <nav v-if="isVisible" class="nav" aria-label="Navigation">
    <ul class="nav-list">
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
