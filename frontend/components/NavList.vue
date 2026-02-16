<script lang="ts" setup>
const defaultsStore = useDefaultsStore()
const { defaults } = storeToRefs(defaultsStore)

const props = defineProps<{
  isVisible: boolean
}>()

const visibleRoutes = computed(() => {
  return defaults.value.navigation.filter(
    (item) => item.meta.template !== 'home',
  )
})
</script>

<template>
  <nav v-if="props.isVisible" class="nav" aria-label="Navigation">
    <ul class="nav-list">
      <NavItem v-for="item in visibleRoutes" :key="item.name" :item="item" />
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
