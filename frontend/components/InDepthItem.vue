<script lang="ts" setup>
const props = defineProps<{
  item: PageReference
}>()

const showItem = computed(() => {
  return props.item?.fields && props.item?.meta
})
</script>

<template>
  <NuxtLink v-if="showItem" :to="props.item.meta.url" class="in-depth-item">
    <div class="in-depth-item" v-text="props.item.fields.title" />
  </NuxtLink>
</template>

<style lang="scss" scoped>
.in-depth-item {
  // @include link-default;
}
</style>
