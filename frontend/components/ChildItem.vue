<script lang="ts" setup>
const props = defineProps<{
  child: childItem
}>()
</script>

<template>
  <NuxtLink :to="props.child.meta.url" class="child-link">
    <div class="child-title" v-text="props.child.fields.title" />
    <CategoryList :categories="props.child.fields.select_category" />
  </NuxtLink>
</template>

<style lang="scss" scoped>
.child-item {
  // @include link-default;
}
</style>
