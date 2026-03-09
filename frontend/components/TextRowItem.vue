<script lang="ts" setup>
const props = defineProps<{
  row: RowItem
}>()

// makes sure row is only shown when all fields are populated
const showRow = computed(() => {
  return props.row?.key.length > 0 && props.row?.value.length > 0
})
</script>

<template>
  <li v-if="showRow" class="text-row-item">
    <FieldText :text="props.row.key" class="row-key" />
    <FieldText :text="props.row.value" class="row-value" />
  </li>
</template>

<style lang="scss" scoped>
.text-row-item {
  display: grid;
  grid-template-columns: 30% 1fr;
  gap: var(--gutter-s);

  &:not(:last-child) {
    margin-bottom: var(--blank-line);
  }

  @media (min-width: $tablet) {
    grid-template-columns: 25% 1fr;
    gap: var(--gutter-xl);
  }
}
</style>
