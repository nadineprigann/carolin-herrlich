<script lang="ts" setup>
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
  {
    name: 10002,
    meta: {
      id: 10002,
      title: 'Archiv',
      url: { path: '/blog', hash: '#archiv' },
      template: 'blog-archive',
    },
    path: '/blog#archiv',
  },
]

const visibleRoutes = computed(() =>
  defaults.value.navigation
    .filter((item) => item.meta.template !== 'home')
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
</script>

<template>
  <nav v-if="layout.openOverlay.navigation" class="nav" aria-label="Navigation">
    <ul class="nav-list">
      <NavItem
        v-for="item in visibleRoutes"
        :key="item.name"
        :item="item"
        @toggle-sub-nav="handleToggleSubNav"
      />
    </ul>
    <AppFooter />
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
  background-color: var(--white);

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
    padding-right: calc(var(--gutter-base) * 10);
  }
}
</style>
