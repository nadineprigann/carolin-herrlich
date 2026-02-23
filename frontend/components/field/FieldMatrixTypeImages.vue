<script lang="ts" setup>
const props = defineProps<{
  item: MatrixTypeImages
}>()
</script>

<template>
  <div class="field-matrix-type-images">
    <FieldImage
      v-for="(image, index) in props.item.images"
      :key="`image-${index}`"
      :image="image"
      class="image"
    />
  </div>
</template>

<style lang="scss" scoped>
.field-matrix-type-images {
  @media (min-width: $small) {
    display: flex;
  }

  // grid-template-columns: repeat(2, minmax(0, 1fr));
}

.image {
  @media (min-width: $small) {
    width: 50%;
    max-width: 50%;
  }
}
</style>
