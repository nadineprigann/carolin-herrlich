<script lang="ts" setup>
const formStore = useFormStore()
const { selected, selectedTitles } = storeToRefs(formStore)

interface TemplateTools extends Page {
  children: ChildItem[]
  categories: Category[]
}

const props = defineProps<{
  data: TemplateTools
}>()

const { fields, categories, breadcrumbs } = toRefs(props.data)
const { toUppercase } = useToUppercase()

const label = reactive({
  random: 'Zufällige Einträge',
  all: 'Alle',
  noResults: 'Keine Einträge vorhanden.',
})

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

// filter children here before passing them down to their list comp. store selected filter(s) in store and use it here to filter children based on their categories. if no filter is selected, show all children. if filter(s) are selected, only show children that have at least one of the selected filters as category.
const filteredChildren = computed(() => {
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
