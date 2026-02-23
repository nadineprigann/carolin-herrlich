<script lang="ts" setup>
const props = defineProps<{
  // item:
}>()
</script>

<template>
  <section class="filter-bar">
    <RefineButton />
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
