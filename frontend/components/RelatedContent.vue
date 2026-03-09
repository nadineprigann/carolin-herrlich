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
    context: ['context-section', contextVisible.value ? 'is-open' : ''],
    depth: ['in-depth-section', depthVisible.value ? 'is-open' : ''],
  }
})
const relatedItem = computed(() => {
  return props.related?.[0] ?? null
})

const showContext = computed(() => {
  return relatedItem.value?.context.length > 0
})

const currentNote = ref({} as Note)
const noteVisible = ref(false)

const closeNote = () => {
  noteVisible.value = false
  currentNote.value = {} as Note
  layout.currentFootnote = null
}

const showInDepth = computed(() => {
  return (relatedItem.value?.in_depth?.length ?? 0) > 0
})

const showRelatedContent = computed(() => {
  return showContext.value || showInDepth.value
})

const showFootnote = computed(() => {
  return Object.keys(currentNote.value).length > 0 && noteVisible.value
})

const contextVisible = ref(false)
const depthVisible = ref(true) // default is visible

function toggleContext() {
  contextVisible.value = !contextVisible.value
}

function toggleDepth() {
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
  <section v-if="showRelatedContent" class="related-content-section">
    <!-- NOTE: Structure used due to the repeater logic wich in turn is necessary to be able to limit in-depth list backendwise. Could use repeater-components but seemed overkill. -->
    <template
      v-for="(content, index) in props.related"
      :key="`related-${index}`"
    >
      <!-- TODO: if no children, use disabled state. necessary to show at all times for consistent layout on overview page (with cover image). if rendered only when content is there, in-depth moves up and its content is flashed. OR: dynamically with refs. -->
      <section v-if="showContext" :class="classes.context">
        <div class="header">
          <FieldText
            element="h4"
            class="label"
            :text="labels.context"
            @click="toggleContext"
          />
        </div>
        <NumberRowList v-if="contextVisible" :table="relatedItem.context" />
      </section>
      <section v-if="showInDepth" :class="classes.depth">
        <div class="header">
          <FieldText
            element="h4"
            class="label"
            :text="labels.in_depth"
            @click="toggleDepth"
          />
        </div>
        <InDepthList v-if="depthVisible" :items="content.in_depth" />
      </section>
    </template>
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

  margin-bottom: var(--gutter-s);
  border-bottom: 1px dashed var(--black);

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
