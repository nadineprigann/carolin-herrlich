<script lang="ts" setup>
import { useRoute } from 'vue-router'
const route = useRoute()

const props = defineProps<{
  breadcrumb: Route
}>()

const isClickable = computed(() => {
  return props.breadcrumb.meta?.clickable ?? false
})

// depending on whether the breadcrumb is a filter link, append saved filter query parameters from history state. saved by ChildItem.vue when navigating to the detail page.
const linkTo = computed(() => {
  // identify the item on which to append the history state filters (if any) by template array
  const templates = ['tools', 'blog', 'events']
  const isFilterCrumb = templates.includes(props.breadcrumb.meta?.template)
  // if not the filter breadcrumb, return normal path (path for other breadcrumbs like permakultur-basics/werkzeugpalette)
  if (!isFilterCrumb) return props.breadcrumb.path
  // client-only: state exists only in the browser
  if (!process.client) return props.breadcrumb.path

  // depending on router/nuxt version, use route.state or window.history.state. typing as well as nullish coalescing in one line
  const savedState: any = (route as any).state ?? window.history.state
  const listFilters = savedState?.listFilters

  // if filters where saved, re-apply them to the template URL
  if (listFilters && Object.keys(listFilters).length) {
    return {
      path: props.breadcrumb.path,
      query: listFilters,
    }
  }
  return props.breadcrumb.path
})
</script>

<template>
  <li class="breadcrumb-item">
    <NuxtLink v-if="isClickable" :to="linkTo" class="link">
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
