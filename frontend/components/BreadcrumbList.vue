<script lang="ts" setup>
const props = defineProps<{
  breadcrumbs: Route[]
}>()

const showBreadcrumbs = computed(() => {
  return props.breadcrumbs.length > 0
})
</script>

<template>
  <ul v-if="showBreadcrumbs" class="breadcrumb-list">
    <BreadcrumbItem
      v-for="breadcrumb in props.breadcrumbs"
      :key="breadcrumb.name"
      :breadcrumb="breadcrumb"
    />
  </ul>
</template>

<style lang="scss" scoped>
.breadcrumb-list {
  @include list-reset;
  @include center-content;
}
</style>
