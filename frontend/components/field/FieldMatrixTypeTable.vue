<script lang="ts" setup>
const props = defineProps<{
  item: MatrixTypeTable
}>()
</script>

<template>
  <div class="field-matrix-type-table">
    <FieldText :text="props.item.title" />
    <RowList :table="props.item.table" />
  </div>
</template>

<style lang="scss" scoped>
// .field-matrix-type-table {}
</style>
