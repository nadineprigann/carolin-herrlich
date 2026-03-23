<script lang="ts" setup>
import { ref, watch } from 'vue'
const layout = useLayoutStore()

const props = defineProps<{
  related: RelatedContent
}>()

const labels = reactive({
  context: 'Kontext',
  in_depth: 'Vertiefung',
})

const classes = computed(() => {
  return {
    context: [
      'context-section',
      hasContext.value ? '' : 'is-disabled',
      contextVisible.value ? 'is-open' : '',
    ],
    depth: [
      'in-depth-section',
      hasInDepth.value ? '' : 'is-disabled',
      depthVisible.value ? 'is-open' : '',
    ],
  }
})

const currentNote = ref({} as Note)
const noteVisible = ref(false)

const closeNote = () => {
  noteVisible.value = false
  currentNote.value = {} as Note
  layout.currentFootnote = null
}

const showFootnote = computed(() => {
  return Object.keys(currentNote.value).length > 0 && noteVisible.value
})

const contextVisible = ref(false)
const depthVisible = ref(true) // default is visible

const relatedItem = computed(() => {
  return props.related?.[0] ?? null
})

// check if there is actual content for the specific section
const hasContext = computed(() => {
  return (
    relatedItem.value?.context?.length > 0 &&
    relatedItem.value?.context[0].number !== ''
  )
})

const hasInDepth = computed(() => {
  return (
    relatedItem.value?.in_depth?.length > 0 &&
    relatedItem.value?.in_depth[0].title !== ''
  )
})

// then show content if it has content AND is toggled open
const showContext = computed(() => {
  return hasContext.value > 0 && contextVisible.value
})

const showInDepth = computed(() => {
  return hasInDepth.value && depthVisible.value
})

// toggle specific section open. make it inactive when there is no content
function toggleContext() {
  if (!hasContext.value) return
  contextVisible.value = !contextVisible.value
}

function toggleDepth() {
  if (!hasInDepth.value) return
  depthVisible.value = !depthVisible.value
}

// watch for store which gets its updates from FieldMatrixTypeText.vue on note click to compare stored note number to context prop to evaluate current note (stored in currentNote)
watch(
  () => layout.currentFootnote,
  (footnote) => {
    if (!footnote) return
    // on change, find the note in the related content table with the matching key by comparing to the footenote stored in layoutStore
    const note = relatedItem.value?.context?.find((n) => n.number === footnote)
    // if found, set the activeNote and visible to true
    if (note) {
      currentNote.value = note
      noteVisible.value = true
    }
  },
)
</script>

<template>
  <section class="related-content-section">
    <!-- v-if="showRelatedContent"  -->
    <!-- NOTE: Structure used due to the repeater logic wich in turn is necessary to be able to limit in-depth list backendwise. Could use repeater-components but seemed overkill. -->
    <!-- <template
      v-for="(content, index) in props.related"
      :key="`related-${index}`"
    > -->
    <!-- TODO: if no children, use disabled state. necessary to show at all times for consistent layout on overview page (with cover image). if rendered only when content is there, in-depth moves up and its content is flashed. OR: dynamically with refs. -->
    <section :class="classes.context">
      <button
        type="button"
        class="header"
        :disabled="!hasContext"
        @click="toggleContext"
      >
        <FieldText element="h3" class="label" :text="labels.context" />
      </button>
      <NumberRowList v-if="showContext" :table="relatedItem.context" />
    </section>
    <section :class="classes.depth">
      <button
        type="button"
        class="header"
        :disabled="!hasInDepth"
        @click="toggleDepth"
      >
        <FieldText element="h3" class="label" :text="labels.in_depth" />
      </button>
      <InDepthList v-if="showInDepth" :items="relatedItem.in_depth" />
    </section>
    <!-- </template> -->
    <!-- TODO: maybe use vue-portal to render the footnote outside of this section? -->
    <!-- pass evaluated local currentNote to FootNote component for rendering -->
    <FootNote v-if="showFootnote" :note="currentNote" @click="closeNote" />
  </section>
</template>

<style lang="scss" scoped>
.related-content-section {
  @include center-content;

  padding-bottom: calc(
    var(--gutter-base) * 3
  ); // use padding here to prevent grid to "cut off" margin and respect spacing

  @media (min-width: $medium) {
    // is set on parent template, so make sure to alwys set it to make it work on desktop
    grid-row: 2 / 3;
    grid-column: 2 / 3;
    padding-bottom: var(--page-end);
  }
}

.header {
  @include toggle-icon;
  @include text-focus;
  @include text-hover;

  width: 100%;
  margin-bottom: var(--gutter-s);
  border-bottom: 1px dashed var(--black);

  .is-disabled & {
    color: var(--disabled-color);
    cursor: default;
    border-color: var(--disabled-color);

    // reset hover styles when disabled. focus styles do not need to be reset cuz button is disabled
    &:hover {
      text-shadow: none;
    }
  }

  @media (min-width: $medium) {
    margin-bottom: var(--gutter-m);
  }
}

.label {
  @include ff-sans;
  @include fs-medium;

  margin-bottom: var(--accordion-title-spacing);
}
</style>
