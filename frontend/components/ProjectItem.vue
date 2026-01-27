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
  <li v-if="showChild" class="project-item">
    <NuxtLink :to="props.child.meta.url" class="link">
      <FieldImage
        v-if="props.child?.fields.image"
        :image="props.child.fields.image"
        class="image"
      />
      <FieldText class="title" element="h4" :text="props.child.fields.title" />
    </NuxtLink>
  </li>
</template>

<style lang="scss" scoped>
.project-item {
  // @include link-default;
}
</style>
