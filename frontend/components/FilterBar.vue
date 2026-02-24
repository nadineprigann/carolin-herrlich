<script lang="ts" setup>
const props = defineProps<{
  // item:
  overlay: 'checkout' | 'filter'
}>()
</script>

<template>
  <section class="filter-bar">
    <OverlayButton :overlay="props.overlay" />
    <SearchBar />
  </section>
</template>

<style lang="scss" scoped>
.filter-bar {
  display: flex;

  // max-width: 80vw;
  // margin: 0 auto;
}
</style>
