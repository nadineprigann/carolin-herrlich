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
  &:not(:last-child) {
    padding-bottom: calc(
      var(--gutter-base) * 5
    ); // just to make sure that if theres no chapter nav and no related content, the space is repsected by the parent grid
  }

  @media (min-width: $tablet) {
    &:not(:last-child) {
      padding-bottom: calc(var(--gutter-base) * 10);
    }
  }
}
</style>
