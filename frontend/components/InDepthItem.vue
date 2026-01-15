<script lang="ts" setup>
const props = defineProps<{
  item: PageReference
}>()
</script>

<template>
  <NuxtLink :to="props.item.meta.url" class="in-depth-item">
    <div class="in-depth-item" v-html="props.item.fields.title" />
  </NuxtLink>
</template>

<style lang="scss" scoped>
.in-depth-item {
  // @include link-default;
}
</style>
