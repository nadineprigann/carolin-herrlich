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
  // template: 'tools' | 'blog' | 'events'
}>()

// const hasAlphabetical = ref(false)
const hasCategorical = ref(false)
// const hasChronological = ref(false)
// const hasCyclical = ref(false)

const labels = reactive({
  overlayTitle: 'Filter',
  title: 'Ansicht verfeinern',
  description:
    'Wähle Filter aus und klicke anschließend auf „Anwenden“, um die Liste zu aktualisieren.',
  // alphabetical: {
  //   title: 'Alphabetisch',
  //   aToZ: {
  //     label: 'A-Z',
  //     value: 'az',
  //     name: 'radio-alphabetical',
  //     id: 'filterAlphabeticalAZ',
  //   },
  //   zToA: {
  //     label: 'Z-A',
  //     value: 'za',
  //     name: 'radio-alphabetical',
  //     id: 'filterAlphabeticalZA',
  //   },
  // },
  categorical: {
    title: 'Kategorisch',
  },
  // chronological: {
  //   title: 'Chronologisch',
  //   currFut: 'aktuell > zukünftig',
  //   futCurr: 'zukünftig > aktuell',
  // },
  // cyclical: {
  //   title: 'Zyklisch',
  //   spring: 'Frühling',
  //   summer: 'Sommer',
  //   autumn: 'Herbst',
  //   winter: 'Winter',
  // },
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

const isSelected = (filter?: PageReference) => {
  return draft.categories?.some((item) => item.meta.id === filter?.meta.id) // some is used to check if at least one filter in the selected filters array matches the given filter by comparing their meta.id. returns true if a match is found, indicating that the filter is currently selected, and false otherwise. used for ARIA selected state + different styling
}

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
  // hasAlphabetical.value = true
  hasCategorical.value = true

  // const advanced = props.template !== 'tools'
  // hasChronological.value = advanced
  // hasCyclical.value = advanced
})

onDeactivated(() => {
  // reset overlay state when navigating away while overlay is open
  closeOverlay()
})

// use composable to stop the body from scrolling when overlay is open. also resets the overflow on unmount and deactivated
htmlOverflowLock(isVisible)
</script>

<template>
  <transition name="t-fade">
    <section
      v-show="isVisible"
      class="filter-overlay"
      role="dialog"
      aria-modal="true"
      :aria-labelledby="titleId"
      :aria-describedby="descId"
      tabindex="-1"
      @keydown.esc.prevent.stop="closeOverlay"
    >
      <CloseButton :overlay-title="labels.overlayTitle" @click="closeOverlay" />

      <form class="form" @submit.prevent="send">
        <section class="content">
          <FieldText
            :id="titleId"
            element="h2"
            :text="labels.title"
            class="title"
          />
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
          <div role="group" :aria-labelledby="`${titleId}-kategorisch`">
            <FieldText
              :id="`${titleId}-kategorisch`"
              element="h3"
              :text="labels.categorical.title"
              class="subtitle"
            />
            <ul class="filter-list">
              <li v-for="item in filters" :key="item.id" class="filter">
                <FormButton
                  :filter="item"
                  class="parent"
                  :selected="isSelected(item)"
                  @select-filter="handleSelectedFilter"
                />
                <FormButton
                  v-for="child in item.children"
                  :key="child.id"
                  :filter="child"
                  class="child"
                  :selected="isSelected(child)"
                  @select-filter="handleSelectedFilter"
                />
              </li>
            </ul>
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
  </transition>
</template>

<style lang="scss">
// defined in _transitions.scss
@include t-fade($duration: var(--short));
</style>

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
  padding: var(--gutter-m) var(--gutter-s);
  overflow: hidden;
  background-color: var(--white-90);
  backdrop-filter: blur(var(--bg-blur));

  @media (min-width: $medium) {
    padding: var(--gutter-m);
  }
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

.title {
  @include fs-xlarge;
  @include ff-sans;

  max-width: var(--title-width);
  margin-bottom: var(--gutter-xl);
}

.form {
  @include center-content;

  display: flex;
  flex-direction: column;
  height: 100%;
}

.content {
  gap: 0 var(--gutter-m);
  height: 100%;
}

.subtitle {
  @include ff-sans;

  margin-bottom: var(--gutter-base);
}

.filter-list {
  max-width: 80vw;

  @include list-reset;
}

.filter {
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 0 var(--gutter-s);
  place-items: start start;

  &:not(:last-child) {
    margin-bottom: var(--gutter-base);
  }
}

.child {
  grid-column: 2 / 3;

  &:first-child {
    grid-row: 1 / 2;
  }

  &:not(:last-child) {
    margin-bottom: var(--gutter-base);
  }
}

.parent + .child {
  position: relative;

  &::before {
    position: absolute;
    left: -10vw;
    content: '\27f6';
  }
}

.parent {
  grid-row: 1;
  grid-column: 1 / 2;

  &:hover {
    // target sibling element, child in this case, to apply highlight styles when hovering parent element. this is needed because the parent and child elements are not nested, but siblings in the DOM structure
    ~ .child {
      border: 1px var(--highlight-color) solid;
    }
  }
}

.controls {
  display: flex;
  justify-content: flex-end;
}

.apply,
.reset {
  @include button-default;
  @include button-padding(
    $top: 0.4em,
    $bottom: var(--spacing-xs),
    $left: var(--spacing-l),
    $right: var(--spacing-l)
  );
  @include hover-default;
  @include focus-default;
}

.apply {
  margin-right: var(--gutter-s);
}
</style>
