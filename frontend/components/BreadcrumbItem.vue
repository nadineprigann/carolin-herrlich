<script lang="ts" setup>
const props = defineProps<{
  breadcrumb: Route
}>()
</script>

<template>
  <li class="breadcrumb-item">
    <FieldText element="h5" class="title" :text="props.breadcrumb.meta.title" />
  </li>
</template>

<style lang="scss" scoped>
.breadcrumb-item {
  // @include link-default;
}
</style>
