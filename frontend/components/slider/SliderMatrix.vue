<script lang="ts" setup>
const props = defineProps<{
  items?: MatrixItem[]
}>()

const currentSlide = ref(0)
let interval: number | undefined
const delay = 8000

const firstSlide = computed(() => props.items?.[0])
const slideCount = computed(() => props.items?.length)
const lastSlide = computed(() => currentSlide.value === slideCount.value - 1)

const currentItem = computed(() => {
  if (!props.items) return
  return props.items[currentSlide.value]
})

function prev() {
  if (!slideCount.value) return
  currentSlide.value =
    (currentSlide.value - 1 + slideCount.value) % slideCount.value
}

function next() {
  if (!slideCount.value) return
  currentSlide.value = (currentSlide.value + 1) % slideCount.value
}

function autoplay() {
  interval = setInterval(next, delay)
}

onMounted(() => {
  if (slideCount.value > 1) autoplay()
})

onActivated(() => {
  if (slideCount.value > 1) autoplay()
})

onDeactivated(() => {
  clearInterval(interval)
})
</script>

<template>
  <div v-if="slideCount" class="slider-matrix">
    <transition name="t-slide" mode="">
      <section :key="currentSlide" class="slides">
        <SliderMatrixItem
          :key="`home-slide-item-${currentSlide.value}`"
          :item="currentItem"
        />
      </section>
    </transition>
  </div>
</template>

<style lang="scss">
// defined in _transitions.scss
@include t-slide;
</style>

<style lang="scss" scoped>
.slider-matrix {
  position: relative;
  flex: 1 1 0; // allow to grow and shrink, but start at 0 to prevent overflow when there are no items
  height: 100%;
  min-height: 0;
}

.slides {
  height: 100%;
}
</style>
