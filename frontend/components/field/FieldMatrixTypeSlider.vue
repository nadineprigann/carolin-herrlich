<script lang="ts" setup>
// import { Swiper, SwiperSlide } from 'swiper/vue'
// import 'swiper/css'

const props = defineProps<{
  item: MatrixTypeImages
}>()

// const swiper = new Swiper('.field-matrix-type-slider', {
//   // Optional parameters
//   loop: true,
// })
// const onSwiper = (swiper: any) => {
//   console.log(swiper)
// }

// const onSlideChange = () => {
//   console.log('slide change')
// }
</script>

<template>
  <div class="field-matrix-type-slider">
    <!-- <div class="swiper-wrapper"> -->
    <!-- <swiper
    class="field-matrix-type-slider"
    :slides-per-view="'auto'"
    @swiper="onSwiper"
    @slide-change="onSlideChange"
  >
    <swiper-slide
      v-for="(image, index) in props.item.images"
      :key="`image-${index}`"
      class="swiper-slide"
    > -->
    <FieldImage
      v-for="(image, index) in props.item.images"
      :key="`image-${index}`"
      :image="image"
      class="image"
      :mode="'slider'"
      :show-caption="false"
    />
    <!-- </swiper-slide>
  </swiper> -->
    <!-- </div> -->
  </div>
</template>

<style lang="scss" scoped>
.field-matrix-type-slider {
  display: flex;
  align-items: stretch;
  height: 30vh;
  overflow-x: auto;
  scroll-snap-type: x mandatory;
}

// .swiper-slide {
// display: flex;

// align-items: stretch;
// width: auto;
// height: 30vh;

// :deep(.image-caption) {
//   width: 100%;
//   overflow-wrap: anywhere;
// }
// }

// :deep(.field-image.image) {
// display: inline-grid;

// min-width: 0;

// width: auto;
// height: 100%;

// min-height: 0;

// :deep(img) {
//   width: auto;
//   height: 100%;
// }

// object-fit: cover;
// }
</style>
