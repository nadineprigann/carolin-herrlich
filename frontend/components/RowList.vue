<script lang="ts" setup>
const props = defineProps<{
  table?: RowItem[]
}>()
</script>

<template>
  <div class="row-list">
    <RowItem
      v-for="(row, index) in props.table"
      :key="`row-${index}`"
      :row="row"
    />
  </div>
</template>

<style lang="scss" scoped>
// .row-list {}
</style>
