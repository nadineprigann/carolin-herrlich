<script lang="ts" setup>
const props = defineProps<{
  slides: Image[]
}>()
</script>

<template>
  <ul class="image-slider">
    <ImageSlide
      v-for="(slide, index) in props.slides"
      :key="`slide-${index}`"
      :slide="slide"
    />
  </ul>
</template>

<style lang="scss" scoped>
.image-slider {
  @include list-reset;
}
</style>
