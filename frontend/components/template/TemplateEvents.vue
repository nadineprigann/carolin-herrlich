<script lang="ts" setup>
// TODO: refactor filtering to use composable to use it here and in blog template
const formStore = useFormStore()
const { selected, selectedTitles } = storeToRefs(formStore)

interface TemplateEvents extends Page {
  children: ChildItem[]
}

const props = defineProps<{
  data: TemplateEvents
}>()

const { fields, breadcrumbs, categories } = toRefs(props.data)
const { toUppercase } = useToUppercase()

const label = reactive({
  current: 'Aktuell',
  archive: 'Archiv',
  loadArchive: 'Archiv laden',
  noCurrentResults: 'Keine aktuellen Einträge vorhanden.',
  noArchiveResults: 'Keine Einträge im Archiv vorhanden.',
})

const classes = computed(() => {
  return {
    button: ['button', hasArchive.value ? '' : 'is-disabled'],
  }
})

const archiveLoaded = ref(false)

// use selectedTitles from store to set list title when filter(s) are selected. if no filter is selected, show "all". -> no issue with resetting on leave cuz selectedTitles is reset either manually or when route context fully changes (-> see plugins/2.filter-reset.client.ts). no query dependency, so no issue with query reset on leave.
const currentListTitle = computed(() => {
  const titles = selectedTitles.value.slice(0, 3).map(toUppercase)
  return titles.length ? titles.join(', ') : label.current
})

const showChildren = computed(() => {
  return props.data.children?.length > 0
})

const currentEvents = computed(() => {
  if (!showChildren.value) return []
  return props.data.children?.filter((child) => !child.meta.archived)
})

// filter children here before passing them down to their list comp. store selected filter(s) in store and use it here to filter children based on their categories. if no filter is selected, show all children. if filter(s) are selected, only show children that have at least one of the selected filters as category.
const filteredEvents = computed(() => {
  // if no filters return all children
  if (!selected.value.categories.length) return currentEvents.value

  return currentEvents.value.filter((event) =>
    event.fields.select_category?.some((eventCategory) =>
      selected.value.categories.some(
        (category) => category.meta.id === eventCategory.meta.id,
      ),
    ),
  )
})

const noCurrentResults = computed(() => {
  return filteredEvents.value.length === 0
})

const archivedEvents = computed(() => {
  if (!showChildren.value) return []
  return props.data.children?.filter((child) => child.meta.archived)
})

// filter children here before passing them down to their list comp. store selected filter(s) in store and use it here to filter children based on their categories. if no filter is selected, show all children. if filter(s) are selected, only show children that have at least one of the selected filters as category.
const filteredArchive = computed(() => {
  // if no filters return all children
  if (!selected.value.categories.length) return archivedEvents.value

  return archivedEvents.value.filter((event) =>
    event.fields.select_category?.some((eventCategory) =>
      selected.value.categories.some(
        (category) => category.meta.id === eventCategory.meta.id,
      ),
    ),
  )
})

const noArchiveResults = computed(() => {
  return filteredArchive.value.length === 0
})

const showCurrent = computed(() => {
  if (!showChildren.value) return false
  return currentEvents.value?.length > 0
})

const hasArchive = computed(() => {
  if (!showChildren.value) return false
  return archivedEvents.value?.length > 0
})

const showArchive = computed(() => {
  return hasArchive.value && archiveLoaded.value
})

const showArchiveButton = computed(() => {
  return !archiveLoaded.value
})

const loadArchive = () => {
  archiveLoaded.value = true
}
</script>

<template>
  <main class="template-events">
    <BreadcrumbList :breadcrumbs="breadcrumbs" />
    <FieldText element="h2" :text="fields.title" class="title" />
    <FilterBar :overlay="'filter'" />
    <section v-show="showCurrent" id="current-events" class="current">
      <FieldText class="label" element="h3" :text="currentListTitle" />
      <ChildList :children="filteredEvents" />
      <FieldText
        v-if="noCurrentResults"
        class="feedback"
        :text="label.noCurrentResults"
      />
    </section>
    <section id="archived-events" class="archive">
      <button
        v-show="showArchiveButton"
        type="button"
        :class="classes.button"
        :disabled="!hasArchive"
        @click="loadArchive"
        v-text="label.loadArchive"
      />
      <div v-if="showArchive">
        <FieldText class="label" element="h3" :text="label.archive" />
        <ChildList :children="filteredArchive" />
        <FieldText
          v-if="noArchiveResults"
          class="feedback"
          :text="label.noArchiveResults"
        />
      </div>
    </section>
    <FilterOverlay
      :filters="categories"
      :template="'events'"
      :title="fields.title"
    />
  </main>
</template>

<style lang="scss" scoped>
.template-events {
  padding: var(--page-spacing);
}

.title,
.current,
.archive {
  @include center-content;
}

.title,
.label {
  @include ff-sans;
}

.title {
  @include fs-xlarge;

  margin-bottom: var(--gutter-xl);

  @media (min-width: $medium) {
    margin-bottom: calc(var(--gutter-base) * 5);
  }
}

.button {
  @include button-default;
  @include hover-default;
  @include focus-default;
  @include center-content;

  display: flex;
  max-width: max-content;
  margin-bottom: var(--gutter-xl);

  &.is-disabled {
    color: var(--disabled-color);
    cursor: default;
    border-color: var(--disabled-color);

    // reset hover styles when disabled. focus styles do not need to be reset cuz button is disabled
    &:hover {
      box-shadow: none;
    }
  }
}

.label {
  @include fs-medium;

  padding-bottom: var(--accordion-title-spacing);
  border-bottom: 1px solid var(--black);
}

.current {
  // note: remove the following delcaration when archive is implemented

  padding-bottom: var(--page-end);
}

// .archive {
//   padding-bottom: var(--page-end);
//   margin-top: calc(var(--gutter-base) * 5);

//   @media (min-width: $tablet) {
//     margin-top: calc(var(--gutter-base) * 10);
//   }
// }

.feedback {
  margin-top: var(--gutter-base);
  font-size: var(--fs-small);
}
</style>
