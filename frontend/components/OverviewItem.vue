<script lang="ts" setup>
const props = defineProps<{
  item: OverviewItem
}>()
</script>

<template>
  <FieldImage :image="props.item.fields.image" />
  <NuxtLink :to="props.item.meta.url" class="nav-item">
    <div class="overviewitem" v-html="props.item.fields.title" />
  </NuxtLink>
</template>

<style lang="scss" scoped>
.item-item {
  // @include link-default;
}
</style>
