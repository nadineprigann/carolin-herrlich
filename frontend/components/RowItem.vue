<script lang="ts" setup>
const props = defineProps<{
  row: RowItem
}>()

const showRow = computed(() => {
  return props.row?.key && props.row?.value.value
})
</script>

<template>
  <div v-if="showRow" class="row-item">
    <FieldText :text="props.row.key" class="row-key" />
    <FieldText :text="props.row.value" class="row-value" />
  </div>
</template>

<style lang="scss" scoped>
// .row-item {}
</style>
