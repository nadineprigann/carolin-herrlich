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
  <ImageSlider :slides="item.images" :mode="'content'" :show-caption="false" />
  <!-- <ul class="field-matrix-type-slider"> -->
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
  <!-- <ImageSlide
      v-for="(image, index) in props.item.images"
      :key="`image-${index}`"
      :slide="image"
      class="slide"
      :mode="'content'"
    /> -->

  <!-- <FieldImage
        v-for="(image, index) in props.item.images"
        :key="`image-${index}`"
        :image="image"
        class="image"
        :mode="'content'"
        :show-caption="false"
      /> -->
  <!-- </swiper-slide>
  </swiper> -->
  <!-- </div> -->
  <!-- </ul> -->
</template>

<style lang="scss" scoped>
// .field-matrix-type-slider {}
</style>
