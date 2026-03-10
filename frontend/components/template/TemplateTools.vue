<script lang="ts" setup>
import { useRoute } from 'vue-router'
const { normalizeToArray } = useNormalizeArray()

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
})

// true only while navigation away from this page is happening
const isLeaving = ref(false)

// Cache of last “good” title, so it doesn’t flicker during navigation
const prevTitle = ref(label.all)

// Pure title derived from current query
const titleFromQuery = computed(() => {
  const values = normalizeToArray(route.query.filter)
  const titles = values.slice(0, 3).map(toUppercase)
  return titles.length ? titles.join(', ') : label.all
})

// use route query to set list title if filtered by a filter
const listTitle = computed(() => {
  return isLeaving.value ? prevTitle.value : titleFromQuery.value
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
  return props.data.children?.filter((child) => {
    // check if child has category that matches selected filter(s)
    // if no filter is selected, show all children
    return true
  })
})

const showRandomChildren = computed(() => {
  return props.data.children?.length > 3
})

// Keep cache updated while NOT leaving to reflect ui changes
watch(
  titleFromQuery,
  (newTitle) => {
    if (!isLeaving.value) {
      prevTitle.value = newTitle
    }
  },
  { immediate: true },
)

// When leaving, freeze the title (keep lastStableTitle)
onBeforeRouteLeave(() => {
  isLeaving.value = true
})
</script>

<template>
  <main class="template-tools">
    <BreadcrumbList :breadcrumbs="breadcrumbs" />
    <FieldText element="h2" :text="fields.title" class="title" />
    <!-- <FilterBar :overlay="'filter'" /> -->
    <section class="children">
      <FieldText class="label" element="h3" :text="listTitle" />
      <ChildList v-if="showChildren" :children="props.data.children" />
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
