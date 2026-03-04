<script lang="ts" setup>
const props = defineProps<{
  breadcrumbs: Route[]
}>()

const showBreadcrumbs = computed(() => {
  return props.breadcrumbs.length > 0
})
</script>

<template>
  <nav aria-label="Breadcrumb" class="breadcrumb-list">
    <ul v-if="showBreadcrumbs" class="list">
      <BreadcrumbItem
        v-for="breadcrumb in props.breadcrumbs"
        :key="breadcrumb.name"
        :breadcrumb="breadcrumb"
      />
    </ul>
  </nav>
</template>

<style lang="scss" scoped>
.breadcrumb-list {
  margin-top: var(
    --gutter-base
  ); // use this to create same spacing as to bottom of overview cover. account for in gap of default layout grid.

  margin-bottom: var(--gutter-xl);

  @media (min-width: $medium) {
    margin-bottom: calc(var(--gutter-base) * 5);
  }
}

.list {
  @include list-reset;
  @include center-content;

  display: flex;
}
</style>
