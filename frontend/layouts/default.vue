<script lang="ts" setup>
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const componentStyle = computed(() => {
  return {
    paddingTop: layout.value.headerHeight + 'px',
  }
})
</script>

<template>
  <div class="layout-default">
    <AppHeader />
    <!-- :style="componentStyle" -->
    <div>
      <slot />
    </div>
    <!-- <AppFooter /> -->
  </div>
</template>

<style lang="scss" scoped>
// .layout-default {}
</style>
