<script lang="ts" setup>
const props = defineProps<{
  items?: MatrixItem[]
  accordionTitle?: string
}>()
</script>

<template>
  <div v-if="props.items?.length" class="field-matrix">
    <FieldMatrixItem
      v-for="(item, index) in props.items"
      :key="`item-${index}`"
      :item="item"
      :accordion-title="props.accordionTitle"
    />
  </div>
</template>

<style lang="scss" scoped>
.field-matrix {
  &:not(last-child) {
    margin-bottom: var(--page-end);
  }
}
</style>
