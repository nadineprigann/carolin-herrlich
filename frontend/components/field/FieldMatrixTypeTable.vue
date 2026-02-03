<script lang="ts" setup>
const props = defineProps<{
  item: MatrixTypeTable
}>()
</script>

<template>
  <div class="field-matrix-type-table">
    <FieldText element="h4" :text="props.item.title" />
    <TextRowList :table="props.item.table" />
  </div>
</template>

<style lang="scss" scoped>
// .field-matrix-type-table {}
</style>
