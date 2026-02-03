<script lang="ts" setup>
const props = defineProps<{
  row: Note
}>()

// makes sure row is only shown when all fields are popluated
const showRow = computed(() => {
  return props.row?.number !== undefined && props.row?.text.length > 0
})
</script>

<template>
  <li v-if="showRow" class="number-row-item">
    <div class="number">{{ props.row.number }}</div>
    <FieldText :text="props.row.text" class="text" />
  </li>
</template>

<style lang="scss" scoped>
// .number-row-item {}
</style>
