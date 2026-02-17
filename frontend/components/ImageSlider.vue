<script lang="ts" setup>
const props = defineProps<{
  slides: Image[]
}>()

const currentSlide = ref(0)
let interval: number | undefined
const delay = 5000

const firstSlide = computed(() => props.slides?.[0])
const slideCount = computed(() => props.slides?.length)
const lastSlide = computed(() => currentSlide.value === slideCount.value - 1)

const currentItem = computed(() => {
  if (!props.slides) return
  return props.slides[currentSlide.value]
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

function stopAutoplay() {
  if (interval) clearInterval(interval)
  interval = undefined
}

function autoplay() {
  stopAutoplay()
  interval = setInterval(next, delay)
}

onMounted(() => {
  if (slideCount.value > 1) autoplay()
})

onActivated(() => {
  if (slideCount.value > 1) autoplay()
})

onDeactivated(() => {
  stopAutoplay()
})

onUnmounted(stopAutoplay)
</script>

<template>
  <ul v-if="slideCount" class="image-slider">
    <transition name="t-slide">
      <ImageSlide :key="`slide-${currentSlide}`" :slide="currentItem" />
    </transition>
  </ul>
</template>

<style lang="scss">
// defined in _transitions.scss, variables in _variables.scss
@include t-slide($duration: var(--long), $delay: var(--medium));
</style>

<style lang="scss" scoped>
.image-slider {
  @include list-reset;

  position: relative; // for absolute positioning of slides during transition
  height: 30vh;
}
</style>
