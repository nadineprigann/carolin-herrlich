<script lang="ts" setup>
const props = defineProps<{
  item: MatrixTypeImages
}>()
</script>

<template>
  <div class="field-matrix-type-slider">
    <FieldImage
      v-for="(image, index) in props.item.images"
      :key="`image-${index}`"
      :image="image"
    />
  </div>
</template>

<style lang="scss" scoped>
// .field-matrix-type-slider {}
</style>
