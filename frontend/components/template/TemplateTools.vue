<script lang="ts" setup>
import { useRoute } from 'vue-router'
const { normalizeToArray } = useNormalizeArray()

interface TemplateTools extends Page {
  children: childItem[]
}

const props = defineProps<{
  data: TemplateTools
}>()

const { fields, breadcrumbs } = toRefs(props.data)
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
    <FieldText element="h2" :text="fields.title" />
    <FilterBar />
    <section class="children">
      <FieldText class="label" element="h3" :text="listTitle" />
      <ChildList v-if="showChildren" :children="props.data.children" />
    </section>
    <section class="random">
      <FieldText class="label" element="h3" :text="label.random" />
      <ChildList v-if="showRandomChildren" :children="randomChildren" />
    </section>
  </main>
</template>

<style lang="scss" scoped>
.template-tools {
  @include center-content;
}
</style>
