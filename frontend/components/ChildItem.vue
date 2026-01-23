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
</script>

<template>
  <NuxtLink v-if="showChild" :to="props.child.meta.url" class="child-link">
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
