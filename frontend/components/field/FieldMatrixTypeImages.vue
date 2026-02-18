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
    />
  </div>
</template>

<style lang="scss" scoped>
.field-matrix-type-images {
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
}
</style>
