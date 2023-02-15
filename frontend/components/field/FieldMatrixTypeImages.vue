<script lang="ts" setup>
const props = defineProps<{
  item: {
    type: string
    images: Image[]
  }
}>()
</script>

<template>
  <div class="field-matrix-type-images">
    <BaseImage
      v-for="(image, index) in props.item.images"
      :key="`image-${index}`"
      :image="image"
    />
  </div>
</template>

<style lang="scss" scoped>
// .field-matrix-type-images {}
</style>
