<script lang="ts" setup>
const props = defineProps<{
  categories?: PageReference[]
}>()
</script>

<template>
  <div class="category-list">
    <CategoryItem
      v-for="category in props.categories"
      :key="category.name"
      :category="category"
    />
  </div>
</template>

<style lang="scss" scoped>
// .category-list {}
</style>
