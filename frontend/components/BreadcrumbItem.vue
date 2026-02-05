<script lang="ts" setup>
import { useRoute } from 'vue-router'
const route = useRoute()
const { toUppercase } = useToUppercase()
const { normalizeToArray } = useNormalizeArray()

const props = defineProps<{
  breadcrumb: Route
}>()

const templates = ['tools', 'blog', 'events'] // templates for which filter titles should be shown in breadcrumb
const visibleFilterTitles = ref([]) // local instance for storing filter titles to be able to display them regardless of query state (they get resetted as soon as user starts navigating). middleman so to say. we want to fade them out when nav is finished nut when it starts. needed for navigating away.
const showTitles = ref(false) // flag to determine if component is mounted
const isClickable = computed(() => {
  return props.breadcrumb.meta?.clickable ?? false
})

// fetch saved filters from route state or query params
const savedFilters = computed(() => {
  // only access history state on client, once its defined, on client
  if (!process.client) return undefined
  // depending on router/nuxt version, use route.state or window.history.state. typing as well as nullish coalescing in one line
  const state = (route as any).state ?? window.history.state
  // check if query param is set (for initial page visit with pre-selecred category) or...
  return (
    route.query.filter ||
    // ...if history state has saved filters (when navigating back from a detail page with filters applied)
    (process.client && state?.listFilters?.filter)
  )
})

// used for routing only. depending on whether breadcrumb is a link with filter possibility, append saved filter query params using savedFilters. state was saved by ChildItem.vue when navigating to the detail page.
const linkTo = computed(() => {
  // identify the item on which to append the history state filters (if any) by template array
  const isFilterCrumb = templates.includes(props.breadcrumb.meta?.template)
  // if not the filter breadcrumb, return normal path (path for other breadcrumbs like permakultur-basics/werkzeugpalette)
  if (!isFilterCrumb) return props.breadcrumb.path
  // client-only: state exists only in the browser
  if (!process.client) return props.breadcrumb.path

  // if filters where saved, re-apply them to the template URL
  if (savedFilters.value.length > 0) {
    return {
      path: props.breadcrumb.path,
      query: { filter: savedFilters.value },
    }
  }
  return props.breadcrumb.path
})

// this is for visual rendering only. make sure that filter titles are correctly displayed
const filterTitles = computed(() => {
  // normalize saved titles with the helper function to always work with an array
  const normalizedTitles = normalizeToArray(savedFilters.value)

  // remove empty values with Boolean, limit to 3, format to uppercase with the useToUppercase composable and return
  return normalizedTitles.filter(Boolean).slice(0, 3).map(toUppercase)
})

// only show filter titles if at least one exists and breadcrumb component has mounted to avoid flashing too early (normally right when navigation starts on prev page because query params are available immediately but target page is not yet mounted)
const showFilterTitles = computed(() => {
  return visibleFilterTitles.value.length > 0 && showTitles.value
})

// when query-based filterTitles change due to user interaction, update visible titles.
// if they become empty, clear them after a delay (so fade-out can finish).
watch(
  filterTitles,
  (newTitles) => {
    if (newTitles.length > 0) {
      // setTimeout(() => {
      // console.log(visibleFilterTitles.value, '->', newTitles)
      visibleFilterTitles.value = newTitles
      // }, 500)
    }

    // delay clear (match your transition duration)
    // setTimeout(() => {
    //   visibleFilterTitles.value = []
    // }, 550) // <-- set to your fade-out time in ms
  },
  { immediate: true }, // run also on initial load
)

onMounted(() => {
  if (templates.includes(props.breadcrumb.meta.template)) {
    showTitles.value = true
  }
})

onBeforeRouteLeave(() => {
  if (templates.includes(props.breadcrumb.meta.template)) {
    showTitles.value = false
    visibleFilterTitles.value = []
  }
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
      <!-- show filter titles regardless of them being clickable or not but rather shows them only for the breadcrumb that matches an entry in the templates array. see linkTo. child pages are considered bc hostory.state gets called  -->
      <template v-if="showFilterTitles">
        <FieldText
          v-for="(filterTitle, index) in visibleFilterTitles"
          :key="`filter-title-${index}`"
          element="h5"
          class="filter-title"
          :text="filterTitle"
        />
      </template>
    </NuxtLink>
    <template v-else>
      <FieldText
        element="h5"
        class="title"
        :text="props.breadcrumb.meta.title"
      />
      <template v-if="showFilterTitles">
        <FieldText
          v-for="(filterTitle, index) in visibleFilterTitles"
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
