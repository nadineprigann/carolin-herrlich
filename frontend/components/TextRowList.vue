<script lang="ts" setup>
const props = defineProps<{
  table: RowItem[]
}>()
</script>

<template>
  <ul class="text-row-list">
    <TextRowItem
      v-for="(row, index) in props.table"
      :key="`row-${index}`"
      :row="row"
    />
  </ul>
</template>

<style lang="scss" scoped>
.text-row-list {
  @include list-reset;

  padding-bottom: var(--page-end);
}
</style>
