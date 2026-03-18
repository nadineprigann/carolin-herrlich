<script lang="ts" setup>
const props = defineProps<{
  categories?: PageReference[]
}>()
</script>

<template>
  <ul class="category-list">
    <CategoryItem
      v-for="category in props.categories"
      :key="category.name"
      :category="category"
    />
  </ul>
</template>

<style lang="scss" scoped>
.category-list {
  @include list-reset;

  display: flex;
  flex-wrap: wrap; // allow wrapping to multiple lines if needed
  margin-top: var(--gutter-base);
}
</style>
