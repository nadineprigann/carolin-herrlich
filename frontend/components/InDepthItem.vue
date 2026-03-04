<script lang="ts" setup>
const props = defineProps<{
  item: PageReference
}>()

const showItem = computed(() => {
  return props.item?.fields && props.item?.meta
})
</script>

<template>
  <li v-if="showItem" class="in-depth-item">
    <NuxtLink :to="props.item.meta.url" class="link">
      <FieldText element="h5" class="title" :text="props.item.fields.title" />
    </NuxtLink>
  </li>
</template>

<style lang="scss" scoped>
.in-depth-item {
  // @include link-default;
}

.title {
  @include ff-sans;
}
</style>
