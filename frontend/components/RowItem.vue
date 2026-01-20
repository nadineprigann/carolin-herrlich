<script lang="ts" setup>
const props = defineProps<{
  row: RowItem
}>()
</script>

<template>
  <div class="row-item">
    <FieldText :text="props.row.key" class="row-key" />
    <FieldText :text="props.row.value" class="row-value" />
  </div>
</template>

<style lang="scss" scoped>
// .row-item {}
</style>
