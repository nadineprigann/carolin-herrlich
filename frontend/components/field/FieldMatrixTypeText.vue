<script lang="ts" setup>
const props = defineProps<{
  item: MatrixTypeText
}>()
</script>

<template>
  <div class="field-matrix-type-text">
    <FieldTextarea :text="props.item.text" />
  </div>
</template>

<style lang="scss" scoped>
// .field-matrix-type-text {}
</style>
