<script lang="ts" setup>
const props = defineProps<{
  item: MatrixTypeImages
}>()

const sizes = computed(() => {
  return '(min-width: 80em) 47vw, (min-width: 48em) 47vw, 94vw'
})
</script>

<template>
  <div class="field-matrix-type-images">
    <FieldImage
      v-for="(image, index) in props.item.images"
      :key="`image-${index}`"
      :image="image"
      class="image"
      :sizes="sizes"
    />
  </div>
</template>

<style lang="scss" scoped>
.field-matrix-type-images {
  @media (min-width: $small) {
    display: flex;
  }
}

.image {
  &:not(:last-child) {
    margin-bottom: var(--blank-line);
  }

  @media (min-width: $small) {
    width: 50%;
    max-width: 50%;

    // @media (min-width: $tablet) {
    &:not(:last-child) {
      margin-bottom: 0;
    }

    &:nth-child(even) {
      margin-left: var(--gutter-base);
    }

    &:nth-child(odd) {
      margin-right: var(--gutter-base);
    }
  }
}
</style>
