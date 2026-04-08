<script lang="ts" setup>
import { htmlOverflowLock } from '@/composables/useHtmlOverflowLock'

const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)
const formStore = useFormStore()
const { selected, selectedTitles } = storeToRefs(formStore)
const { setQuery, resetQuery } = useUpdateQuery()

const props = defineProps<{
  // to get these filters, make sure to fetch them from the backend. therefore, adjust in DefaultPage.php: the template for which the categories have to be returned; with the specific context of the parent template
  filters: PageReference[]
  template: 'tools' | 'blog' | 'events'
}>()

const hasAlphabetical = ref(false)
const hasCategorical = ref(false)
const hasChronological = ref(false)
const hasCyclical = ref(false)

const labels = reactive({
  buttonClose: 'Filter schließen',
  title: 'Ansicht verfeinern',
  description:
    'Wähle Filter aus und klicke anschließend auf „Anwenden“, um die Liste zu aktualisieren.',
  alphabetical: {
    title: 'Alphabetisch',
    aToZ: {
      label: 'A-Z',
      value: 'az',
      name: 'radio-alphabetical',
      id: 'filterAlphabeticalAZ',
    },
    zToA: {
      label: 'Z-A',
      value: 'za',
      name: 'radio-alphabetical',
      id: 'filterAlphabeticalZA',
    },
  },
  categorical: {
    title: 'Kategorisch',
  },
  chronological: {
    title: 'Chronologisch',
    currFut: 'aktuell > zukünftig',
    futCurr: 'zukünftig > aktuell',
  },
  cyclical: {
    title: 'Zyklisch',
    spring: 'Frühling',
    summer: 'Sommer',
    autumn: 'Herbst',
    winter: 'Winter',
  },
  apply: 'Anwenden',
  reset: 'Zurücksetzen',
})

const isVisible = computed(() => {
  return layout.value.openOverlay.filter
})

const closeOverlay = () => {
  layout.value.openOverlay.filter = false
}

const draft = reactive(JSON.parse(JSON.stringify(selected.value)))
// create a deep copy of the selected filters from the store object to only update the store when applying filters

// const isSelected = (filter?: PageReference) => {
//   return draft.value.some((filter) => filter.meta.id === filter?.meta.id) // some is used to check if at least one filter in the selected filters array matches the given filter by comparing their meta.id. returns true if a match is found, indicating that the filter is currently selected, and false otherwise. used for ARIA selected state + different styling
// }

const handleSelectedFilter = (filter?: PageReference) => {
  if (!filter) return
  // check if filter is already selected, some returns boolean
  if (draft.categories?.some((item) => item.meta.id === filter.meta.id)) {
    // if already selected, remove it from the draft array to deselect it by filtering it out of the array
    draft.categories = draft.categories.filter(
      (item) => item.meta.id !== filter.meta.id,
    )
  } else {
    // if not selected, add it to the draft array to select it. spread operator is used to create a new array with the existing selected filters (or empty array) and the new one, to trigger reactivity in case of nested arrays in the draft object.
    draft.categories = [...(draft.categories || []), filter]
  }
}

const applyFilters = () => {
  // update store with selected filters from draft only when applying filters
  selected.value = JSON.parse(JSON.stringify(draft)) // update selected filters in store by creating a deep copy of the draft object and replacing store object with it instead of only assigning it to avoid reference issues. structuredClone is not working here due to isuses bc cloning a reactive object, therefore JSON is used. this procedure ensures that nested objects and arrays are also copied and not just referenced. This prevents unintended side effects where changes to the draft would directly affect the selected filters in the store before applying. -> references are also updated
  setQuery() // update query with selected filters to make them available BreadcrumbItem and ChildItem for routing and visual purposes. Defined in useUpdateQuery composable.
  closeOverlay()
}

const resetFilters = async () => {
  formStore.clear() // reset selected filters in store to initial values. defined in formStore
  Object.assign(draft, JSON.parse(JSON.stringify(formStore.initial))) // reset local draft to initial values to update the UI accordingly
  await resetQuery() // update query to reset filters in URL. defined in useUpdateQuery composable.
  closeOverlay()
}

const titleId = `filter-titel`
const descId = `filter-beschreibung`

// show sections of filters based on template
watchEffect(() => {
  hasAlphabetical.value = true
  hasCategorical.value = true

  const advanced = props.template !== 'tools'
  hasChronological.value = advanced
  hasCyclical.value = advanced
})

onDeactivated(() => {
  // reset overlay state when navigating away while overlay is open
  closeOverlay()
})

// use composable to stop the body from scrolling when overlay is open. also resets the overflow on unmount and deactivated
htmlOverflowLock(isVisible)
</script>

<template>
  <section
    v-if="isVisible"
    class="filter-overlay"
    role="dialog"
    aria-modal="true"
    :aria-labelledby="titleId"
    :aria-describedby="descId"
    tabindex="-1"
    @keydown.esc.prevent.stop="closeOverlay"
  >
    <button
      type="button"
      class="close"
      :aria-label="labels.buttonClose"
      @click="closeOverlay"
    >
      <span class="label" />
    </button>

    <form class="form" @submit.prevent="send">
      <section class="content">
        <FieldText :id="titleId" element="h2" :text="labels.title" />
        <p :id="descId" class="description" v-text="labels.description" />
        <!-- <div
          v-if="hasAlphabetical"
          role="group"
          :aria-labelledby="`${titleId}-alphabetisch`"
        >
          <FieldText
            :id="`${titleId}-alphabetisch`"
            element="h3"
            :text="labels.alphabetical.title"
          />
          <FormRadio
            :id="labels.alphabetical.aToZ.id"
            v-model="draft.alphabetical"
            :label="labels.alphabetical.aToZ.label"
            :value="labels.alphabetical.aToZ.value"
            :name="labels.alphabetical.aToZ.name"
          />
          <FormRadio
            :id="labels.alphabetical.zToA.id"
            v-model="draft.alphabetical"
            :label="labels.alphabetical.zToA.label"
            :value="labels.alphabetical.zToA.value"
            :name="labels.alphabetical.zToA.name"
          />
          <div class="buttons">
            <FilterButton :title="labels.alphabetical.aToZ" />
            <FilterButton :title="labels.alphabetical.zToA" />
          </div>
        </div> -->
        <div
          v-if="hasCategorical"
          role="group"
          :aria-labelledby="`${titleId}-kategorisch`"
        >
          <FieldText
            :id="`${titleId}-kategorisch`"
            element="h3"
            :text="labels.categorical.title"
          />
          <div class="buttons">
            <FormButton
              v-for="item in filters"
              :key="item.id"
              :filter="item"
              @select-filter="handleSelectedFilter"
            />
            <!-- :selected="isSelected(item)" -->
          </div>
        </div>
        <!-- <div
          v-if="hasChronological"
          role="group"
          :aria-labelledby="`${titleId}-chronologisch`"
        >
          <FieldText
            :id="`${titleId}-chronologisch`"
            element="h3"
            :text="labels.chronological.title"
          />
          <div class="buttons">
            <FilterButton :title="labels.chronological.currFut" />
            <FilterButton :title="labels.chronological.futCurr" />
          </div>
        </div> -->
        <!-- <div
          v-if="hasCyclical"
          role="group"
          :aria-labelledby="`${titleId}-zyklisch`"
        >
          <FieldText
            :id="`${titleId}-zyklisch`"
            element="h3"
            :text="labels.cyclical.title"
          />
          <div class="buttons">
            <FilterButton :title="labels.cyclical.spring" />
            <FilterButton :title="labels.cyclical.summer" />
            <FilterButton :title="labels.cyclical.autumn" />
            <FilterButton :title="labels.cyclical.winter" />
          </div>
        </div> -->
        <!-- TODO: get array of selected filters and only on apply, update query and store them in store to make them availbale for parent to filter their children -->
      </section>
      <section class="controls">
        <button type="button" class="apply" @click="applyFilters">
          <span class="label" v-text="labels.apply" />
        </button>
        <button type="button" class="reset" @click="resetFilters">
          <span class="label" v-text="labels.reset" />
        </button>
      </section>
    </form>
  </section>
</template>

<style lang="scss" scoped>
.filter-overlay {
  position: fixed;
  top: 0;
  left: 0;
  z-index: var(--xl-overlay);
  display: grid;
  grid-template-rows: auto minmax(auto, 1fr) auto;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  background-color: var(--white-90);
  backdrop-filter: blur(var(--bg-blur));
}

.close {
  position: relative;
  z-index: var(--xxl-overlay);
  justify-self: flex-end;
  padding: var(--gutter);

  &::before {
    content: var(--l-close);
  }
}

.description {
  @include visually-hidden;
}

.content,
.controls {
  @include center-content;
}

.buttons {
  display: flex;
  flex-wrap: wrap;
  max-width: 80vw;
}

.controls {
  display: flex;
  justify-content: flex-end;
}

.apply,
.back {
  @include button-default;
}
</style>
