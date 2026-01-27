<script lang="ts" setup>
const props = defineProps<{
  table: RowItem[]
}>()
</script>

<template>
  <ul class="row-list">
    <RowItem
      v-for="(row, index) in props.table"
      :key="`row-${index}`"
      :row="row"
    />
  </ul>
</template>

<style lang="scss" scoped>
.row-list {
  @include list-reset;
}
</style>
