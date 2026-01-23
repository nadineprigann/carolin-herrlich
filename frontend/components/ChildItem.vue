<script lang="ts" setup>
const props = defineProps<{
  child: childItem
}>()

const isEvent = computed(() => {
  return props.child.meta.template === 'event'
})
</script>

<template>
  <NuxtLink :to="props.child.meta.url" class="child-link">
    <div class="child-title" v-text="props.child.fields.title" />
    <FieldText
      v-if="isEvent"
      class="child-description"
      :text="props.child.fields.long_description"
    />
    <CategoryList :categories="props.child.fields.select_category" />
  </NuxtLink>
</template>

<style lang="scss" scoped>
.child-item {
  // @include link-default;
}
</style>
