<script lang="ts" setup>
const props = defineProps<{
  child: childItem
}>()

// TODO: fix computed property to return boolean
const showChild = computed(() => {
  return props.child?.fields && props.child?.meta
})

const isEvent = computed(() => {
  return props.child?.meta.template === 'event'
})

const showDescription = computed(() => {
  return isEvent.value && props.child?.fields.long_description.length > 0
})
</script>

<template>
  <NuxtLink v-if="showChild" :to="props.child.meta.url" class="child-link">
    <FieldText
      element="h5"
      class="child-title"
      :text="props.child.fields.title"
    />
    <FieldTextarea
      v-if="showDescription"
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
