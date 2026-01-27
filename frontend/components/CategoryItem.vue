<script lang="ts" setup>
const props = defineProps<{
  category: PageReference
}>()
</script>

<template>
  <!-- <NuxtLink :to="props.category.meta.url" class="nav-item"> -->
  <FieldText
    element="h5"
    class="category-item"
    :text="props.category.fields.title"
  />
  <!-- </NuxtLink> -->
</template>

<style lang="scss" scoped>
.category-item {
  // @include link-default;
}
</style>
