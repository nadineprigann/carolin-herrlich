<script lang="ts" setup>
const props = defineProps<{
  child: ProjectItem
}>()

// TODO: fix computed property to return boolean
const showChild = computed(() => {
  return props.child?.fields && props.child?.meta
})
</script>

<template>
  <NuxtLink v-if="showChild" :to="props.child.meta.url" class="child-link">
    <FieldImage
      v-if="props.child?.fields.image"
      :image="props.child.fields.image"
    />
    <div class="child-title" v-text="props.child.fields.title" />
  </NuxtLink>
</template>

<style lang="scss" scoped>
.project-item {
  // @include link-default;
}
</style>
