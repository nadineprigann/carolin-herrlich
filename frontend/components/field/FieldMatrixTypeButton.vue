<script lang="ts" setup>
const props = defineProps<{
  item: MatrixTypeButton
}>()
</script>

<template>
  <div class="field-matrix-type-button">
    <OverlayButton :label="props.item.button_title" :overlay="'checkout'" />
  </div>
</template>

<style lang="scss" scoped>
.field-matrix-type-button {
  @include center-content;
}
</style>
