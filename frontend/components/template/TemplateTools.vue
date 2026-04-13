<script lang="ts" setup>
import { useRoute } from 'vue-router'
const { normalizeToArray } = useNormalizeArray()
const formStore = useFormStore()
const { selected, selectedTitles } = storeToRefs(formStore)

interface TemplateTools extends Page {
  children: childItem[]
  categories: Category[]
}

const props = defineProps<{
  data: TemplateTools
}>()

const { fields, categories, breadcrumbs } = toRefs(props.data)
const route = useRoute()
const { toUppercase } = useToUppercase()

const label = reactive({
  random: 'Zufällige Einträge',
  all: 'Alle',
  noResults: 'Keine Einträge vorhanden.',
})

// true only while navigation away from this page is happening
// const isLeaving = ref(false)

// Cache of last “good” title, so it doesn’t flicker during navigation
// const prevTitle = ref(label.all)

// Pure title derived from current query
// const titleFromQuery = computed(() => {
//   const values = normalizeToArray(route.query.filter)
// })

// use selectedTitles from store to set list title when filter(s) are selected. if no filter is selected, show "all". -> no issue with resetting on leave cuz selectedTitles is reset either manually or when route context fully changes (-> see plugins/2.filter-reset.client.ts). no query dependency, so no issue with query reset on leave.
const listTitle = computed(() => {
  const titles = selectedTitles.value.slice(0, 3).map(toUppercase)
  return titles.length ? titles.join(', ') : label.all
})

const randomChildren = computed(() => {
  return props.data.children
    .slice()
    .sort(() => 0.5 - Math.random())
    .slice(0, 3)
})

const showChildren = computed(() => {
  return props.data.children?.length > 0
})

// filter children here before passing them down to their list comp. store selected filter(s) in store and use it here to filter children based on their categories. also update the query from within filter button > maybe use composable for this for other templates
const filteredChildren = computed(() => {
  // props.data.children?.forEach((child) => {
  //   selected.value.categories.forEach((category) => {
  //     if (child.meta.id === category.meta.id) {
  //       filtered.push(child)
  //     } // check if child has category that matches selected filter(s)
  //   })
  //   // if no filter is selected, show all children
  // })

  const children = props.data.children ?? [] // ensure children is always an array to avoid errors when calling filter on undefined

  // if no filters return all children
  if (!selected.value.categories.length) return children

  return children.filter((child) =>
    child.fields.select_category?.some((childCategory) =>
      selected.value.categories.some(
        (category) => category.meta.id === childCategory.meta.id,
      ),
    ),
  )
})

const noResults = computed(() => {
  return filteredChildren.value.length === 0
})

const showRandomChildren = computed(() => {
  return props.data.children?.length > 3
})

// Keep cache updated while NOT leaving to reflect ui changes
// watch(
//   titleFromQuery,
//   (newTitle) => {
//     if (!isLeaving.value) {
//       prevTitle.value = newTitle
//     }
//   },
//   { immediate: true },
// )

// When leaving, freeze the title (keep lastStableTitle)
// onBeforeRouteLeave(() => {
//   isLeaving.value = true
// })
</script>

<template>
  <main class="template-tools">
    <BreadcrumbList :breadcrumbs="breadcrumbs" />
    <FieldText element="h2" :text="fields.title" class="title" />
    <FilterBar :overlay="'filter'" />
    <section class="children">
      <FieldText class="label" element="h3" :text="listTitle" />
      <ChildList v-if="showChildren" :children="filteredChildren" />
      <FieldText v-if="noResults" class="feedback" :text="label.noResults" />
    </section>
    <section class="random">
      <FieldText class="label" element="h3" :text="label.random" />
      <ChildList v-if="showRandomChildren" :children="randomChildren" />
    </section>
    <FilterOverlay :filters="categories" :template="'tools'" />
  </main>
</template>

<style lang="scss" scoped>
.template-tools {
  padding: var(--page-spacing);
}

.title,
.children,
.random {
  @include center-content;
}

.title,
.label {
  @include ff-sans;
  @include fs-medium;
}

.title {
  @include fs-xlarge;

  margin-bottom: var(--gutter-xl);

  @media (min-width: $medium) {
    margin-bottom: calc(var(--gutter-base) * 5);
  }
}

.label {
  padding-bottom: var(--accordion-title-spacing);
  border-bottom: 1px solid var(--black);
}

.random {
  padding-bottom: var(--page-end);
  margin-top: calc(var(--gutter-base) * 5);

  @media (min-width: $tablet) {
    margin-top: calc(var(--gutter-base) * 10);
  }
}
</style>
