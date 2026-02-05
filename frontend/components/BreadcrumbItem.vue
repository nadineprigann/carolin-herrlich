<script lang="ts" setup>
import { useRoute } from 'vue-router'
const route = useRoute()
const { toUppercase } = useToUppercase()

const props = defineProps<{
  breadcrumb: Route
}>()

const isClickable = computed(() => {
  return props.breadcrumb.meta?.clickable ?? false
})

// helper to normalize query param values to array regardless if single string (only one filter selected) or array (multiple filters selected). makes sure that rendering titles of these filters in template never fails due to unexpected data type.
function normalizeToArray(value) {
  // if value is an array, return as is
  if (Array.isArray(value)) return value
  // if value is a string, wrap in array
  if (typeof value === 'string') return [value]
  // if value is undefined or of unexpected type, return empty array
  return []
}

// make sure that filter title is correctly displayed in breadcrumb when coming back to a filtered list from a detail page.
const filterTitles = computed(() => {
  // check if query param is set (for initial page visit with pre-selecred category) or...
  const savedTitles =
    route.query.filter ||
    // ...if history state has saved filters (when navigating back from a detail page with filters applied)
    (process.client && window.history.state?.listFilters?.filter)

  // normalize saved titles with the helper function to always work with an array
  const normalizedTitles = normalizeToArray(savedTitles)

  // remove empty values with Boolean, limit to 3, format to uppercase with the useToUppercase composable and return
  return normalizedTitles.filter(Boolean).slice(0, 3).map(toUppercase)
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

const showFilterTitles = computed(() => {
  return filterTitles && filterTitles.value.length > 0
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
    <template v-else>
      <FieldText
        element="h5"
        class="title"
        :text="props.breadcrumb.meta.title"
      />
      <template v-if="showFilterTitles">
        <FieldText
          v-for="(filterTitle, index) in filterTitles"
          :key="`filter-title-${index}`"
          element="h5"
          class="filter-title"
          :text="filterTitle"
        />
      </template>
    </template>
  </li>
</template>

<style lang="scss" scoped>
.breadcrumb-item {
  // @include link-default;
}
</style>
