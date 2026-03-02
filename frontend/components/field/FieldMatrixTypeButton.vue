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
    <!-- overlay renders here bc button is only used in conjunction with it: no putting two separate comps in different places (global approach). prop gets passed downstream all the way from FieldMatrix.vue (where accordion renders its content) -->
    <CheckOutOverlay :title="props.accordionTitle" />
  </div>
</template>

<style lang="scss" scoped>
.field-matrix-type-button {
  @include center-content;
}
</style>
