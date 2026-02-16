<script lang="ts" setup>
const defaultsStore = useDefaultsStore()
const { defaults } = storeToRefs(defaultsStore)
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const visibleRoutes = computed(() => {
  return defaults.value.navigation.filter(
    (item) => item.meta.template !== 'home',
  )
})

const currentSubNav = ref<number | null>(null)

const handleToggleSubNav = (id: number) => {
  currentSubNav.value = currentSubNav.value === id ? null : id
}
</script>

<template>
  <nav v-if="layout.openOverlay.navigation" class="nav" aria-label="Navigation">
    <ul class="nav-list">
      <NavItem
        v-for="item in visibleRoutes"
        :key="item.name"
        :item="item"
        :current-sub-nav="currentSubNav"
        @toggle-sub-nav="handleToggleSubNav"
      />
    </ul>
  </nav>
</template>

<style lang="scss" scoped>
.nav-list {
  @include list-reset;

  position: fixed;
  top: 0;
  left: 0;
  z-index: 2;
  width: 100%;
  height: 100%;
  background-color: var(--white);
}
</style>
