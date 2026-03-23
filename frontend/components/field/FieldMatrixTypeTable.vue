<script lang="ts" setup>
const props = defineProps<{
  item: MatrixTypeTable
}>()
</script>

<template>
  <div class="field-matrix-type-table">
    <FieldText
      v-if="props.item.title"
      element="h3"
      :text="props.item.title"
      class="title"
    />
    <TextRowList :table="props.item.table" />
  </div>
</template>

<style lang="scss" scoped>
.field-matrix-type-table {
  @include center-content;
}

.title {
  @include ff-sans;

  margin-bottom: var(--blank-line);
}
</style>
