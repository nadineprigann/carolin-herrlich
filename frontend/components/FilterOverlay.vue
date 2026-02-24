<script lang="ts" setup>
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const props = defineProps<{
  filters: Category[]
  template: 'tools' | 'blog' | 'events'
}>()

const hasAlphabetical = ref(false)
const hasCategorical = ref(false)
const hasChronological = ref(false)
const hasCyclical = ref(false)

const showOverlay = computed(() => {
  return layout.value.openOverlay.filter
})

const closeOverlay = () => {
  layout.value.openOverlay.filter = false
}

const applyFilters = () => {
  // ... applying logic
  closeOverlay()
}
const resetFilters = () => {}

const labels = reactive({
  title: 'Ansicht verfeinern',
  alphabetical: {
    title: 'Alphabetisch',
    aToZ: 'A-Z',
    zToA: 'Z-A',
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
</script>

<template>
  <section
    v-if="showOverlay"
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
      aria-label="Filter schließen"
      @click="closeOverlay"
    >
      <span class="label" />
    </button>

    <section class="content">
      <FieldText :id="titleId" element="h2" :text="labels.title" />
      <p :id="descId" class="description">
        Wähle Filter aus und klicke anschließend auf „Anwenden“, um die Liste zu
        aktualisieren.
      </p>
      <div
        v-if="hasAlphabetical"
        role="group"
        :aria-labelledby="`${titleId}-alphabetisch`"
      >
        <FieldText
          :id="`${titleId}-alphabetisch`"
          element="h3"
          :text="labels.alphabetical.title"
        />
        <div class="buttons">
          <FilterButton :title="labels.alphabetical.aToZ" />
          <FilterButton :title="labels.alphabetical.zToA" />
        </div>
      </div>
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
          <FilterButton v-for="item in filters" :key="item.id" :filter="item" />
        </div>
      </div>
      <div
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
      </div>
      <div
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
      </div>
      <!-- TODO: get array of selected filters and only on apply, update query and store them in store to make them availbale for parent to filter their children -->
    </section>
    <div class="controls">
      <button type="button" class="apply" @click="applyFilters">
        <span class="label" v-text="labels.apply" />
      </button>
      <button type="button" class="reset" @click="resetFilters">
        <span class="label" v-text="labels.reset" />
      </button>
    </div>
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

.close,
.apply,
.back {
  @include button-reset;
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
