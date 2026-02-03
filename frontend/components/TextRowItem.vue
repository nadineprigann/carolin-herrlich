<script lang="ts" setup>
const props = defineProps<{
  row: RowItem
}>()

// makes sure row is only shown when all fields are popluated
const showRow = computed(() => {
  return props.row?.key.length > 0 && props.row?.value.length > 0
})
</script>

<template>
  <li v-if="showRow" class="textrow-item">
    <FieldText :text="props.row.key" class="row-key" />
    <FieldText :text="props.row.value" class="row-value" />
  </li>
</template>

<style lang="scss" scoped>
// .text-row-item {}
</style>
