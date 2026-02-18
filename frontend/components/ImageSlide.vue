<script lang="ts" setup>
const props = defineProps<{
  slide: Image
}>()
</script>

<template>
  <li class="image-slide">
    <FieldImage :image="props.slide" class="image" />
    <!-- <div class="child-title" v-text="props.child.fields.title" /> -->
  </li>
</template>

<style lang="scss" scoped>
.image-slide {
  width: 100%;
  height: 100%;

  // overflow: hidden;

  :deep(img) {
    height: 100%;
    object-fit: contain;
  }
}
</style>
