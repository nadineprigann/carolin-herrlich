<script lang="ts" setup>
// Import layout store to manage footnote state
const layout = useLayoutStore()

const props = defineProps<{
  item: MatrixTypeText
}>()

const handleNoteClick = (event: MouseEvent) => {
  // get the number of the footnote using the footnoteNumber util
  const noteNumber = footnoteNumber(event)
  // if its not null, store the number in the layoutStore to be able to use it in RelatedContent.vue to handle the display of the note
  if (noteNumber) {
    layout.currentFootnote = noteNumber
  }
}
</script>

<template>
  <div class="field-matrix-type-text" @click="handleNoteClick">
    <FieldTextarea :text="props.item.text" />
  </div>
</template>

<style lang="scss" scoped>
// .field-matrix-type-text {}
</style>
