<script lang="ts" setup>
const props = defineProps<{
  table: Note[]
}>()
</script>

<template>
  <ul class="number-row-list">
    <NumberRowItem
      v-for="(row, index) in props.table"
      :key="`row-${index}`"
      :row="row"
    />
  </ul>
</template>

<style lang="scss" scoped>
.number-row-list {
  @include list-reset;
}
</style>
