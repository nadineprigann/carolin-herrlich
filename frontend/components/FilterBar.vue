<script lang="ts" setup>
const props = defineProps<{
  // item:
  overlay: 'checkout' | 'filter'
}>()
</script>

<template>
  <section class="filter-bar">
    <OverlayButton :overlay="props.overlay" />
    <!-- <SearchBar /> -->
  </section>
</template>

<style lang="scss" scoped>
.filter-bar {
  @include center-content;

  display: flex;
  margin-bottom: var(--gutter-xl);

  @media (min-width: $medium) {
    margin-bottom: calc(var(--gutter-base) * 5);
  }
}
</style>
