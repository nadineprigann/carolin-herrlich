<script lang="ts" setup>
const props = defineProps<{
  category: PageReference
}>()
</script>

<template>
  <li class="category-item">
    <FieldText element="h5" class="title" :text="props.category.fields.title" />
  </li>
</template>

<style lang="scss" scoped>
.category-item {
  // @include link-default;
}
</style>
