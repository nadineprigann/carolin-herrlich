<script lang="ts" setup>
const props = defineProps<{
  breadcrumb: Route
}>()

const isClickable = computed(() => {
  return props.breadcrumb.meta?.clickable ?? false
})
</script>

<template>
  <li class="breadcrumb-item">
    <NuxtLink v-if="isClickable" :to="props.breadcrumb.path" class="link">
      <FieldText
        element="h5"
        class="title"
        :text="props.breadcrumb.meta.title"
      />
    </NuxtLink>
    <FieldText
      v-else
      element="h5"
      class="title"
      :text="props.breadcrumb.meta.title"
    />
  </li>
</template>

<style lang="scss" scoped>
.breadcrumb-item {
  // @include link-default;
}
</style>
