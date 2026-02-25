<script lang="ts" setup>
const props = defineProps<{
  item: MatrixItem
  accordionTitle?: string
}>()

// Pick component based on matrix type
// TODO: Ideally, this would be possible by just passing the component name as a string
// see https://nuxt.com/docs/guide/directory-structure/components/#dynamic-components
const FieldMatrixTypeText = resolveComponent('FieldMatrixTypeText')
const FieldMatrixTypeImages = resolveComponent('FieldMatrixTypeImages')
const FieldMatrixTypeSlider = resolveComponent('FieldMatrixTypeSlider')
const FieldMatrixTypeAccordion = resolveComponent('FieldMatrixTypeAccordion')
const FieldMatrixTypeTable = resolveComponent('FieldMatrixTypeTable')
const FieldMatrixTypeButton = resolveComponent('FieldMatrixTypeButton')
// Register new types here...

const type = computed(() => {
  if (props.item.type === 'type_text') return FieldMatrixTypeText
  if (props.item.type === 'type_images') return FieldMatrixTypeImages
  if (props.item.type === 'type_slider') return FieldMatrixTypeSlider
  if (props.item.type === 'type_accordion') return FieldMatrixTypeAccordion
  if (props.item.type === 'type_table') return FieldMatrixTypeTable
  if (props.item.type === 'type_button') return FieldMatrixTypeButton
  // ... and match them here
})
</script>

<template>
  <component
    :is="type"
    :item="item"
    :accordion-title="accordionTitle"
    class="field-matrix-item"
  />
</template>

<style lang="scss" scoped>
// .field-matrix-item {}
</style>
