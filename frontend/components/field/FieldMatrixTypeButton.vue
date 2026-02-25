<script lang="ts" setup>
const props = defineProps<{
  item: MatrixTypeButton
  accordionTitle?: string
}>()
</script>

<template>
  <div class="field-matrix-type-button">
    <OverlayButton
      :label="props.item.button_title"
      :overlay="'checkout'"
      :accordion-title="props.accordionTitle"
    />
    <CheckOutOverlay :title="props.accordionTitle" />
  </div>
</template>

<style lang="scss" scoped>
.field-matrix-type-button {
  @include center-content;
}
</style>
