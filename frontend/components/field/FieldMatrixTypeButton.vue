<script lang="ts" setup>
const props = defineProps<{
  item: MatrixTypeButton
}>()
</script>

<template>
  <div class="field-matrix-type-button">
    <CustomButton :label="props.item.button_title" />
  </div>
</template>

<style lang="scss" scoped>
// .field-matrix-type-button {}
</style>
