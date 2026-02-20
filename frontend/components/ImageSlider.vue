<script lang="ts" setup>
const props = defineProps<{
  slides: Image[]
  mode?: 'content' | 'overview' | 'default'
}>()

const currentSlide = ref(0)
let interval: number | undefined
const delay = 5000

const modeClass = computed(() => {
  return {
    'is-content': props.mode === 'content',
    'is-overview': props.mode === 'overview',
  }
})

const firstSlide = computed(() => props.slides?.[0])
const slideCount = computed(() => props.slides?.length)
const lastSlide = computed(() => currentSlide.value === slideCount.value - 1)
const isOverview = computed(() => props.mode === 'overview')
const isContent = computed(() => props.mode === 'content')

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
  if (slideCount.value > 1 && isOverview.value) autoplay()
})

onActivated(() => {
  if (slideCount.value > 1 && isOverview.value) autoplay()
})

onDeactivated(() => {
  stopAutoplay()
})

onUnmounted(stopAutoplay)
</script>

<template>
  <ul v-if="slideCount" class="image-slider" :class="modeClass">
    <transition v-if="isOverview" name="t-slide">
      <ImageSlide
        :key="`overview-slide-${currentSlide}`"
        :slide="currentItem"
        :mode="props.mode"
      />
    </transition>
    <template v-else-if="isContent">
      <ImageSlide
        v-for="(slide, index) in props.slides"
        :key="`content-slide-${index}`"
        :slide="slide"
        :mode="props.mode"
      />
    </template>
    <ImageSlide
      v-else
      :key="`slide-${currentSlide}`"
      :slide="currentItem"
      :mode="props.mode"
    />
  </ul>
</template>

<!-- <style lang="scss">
// defined in _transitions.scss, variables in _variables.scss
</style> -->

<style lang="scss" scoped>
.image-slider {
  @include list-reset;

  &.is-overview {
    @include t-slide($duration: var(--long), $delay: var(--medium));

    position: relative; // for absolute positioning of slides during transition
    height: 30vh;
  }

  &.is-content {
    display: flex;
    align-items: stretch;
    height: 30vh;
    overflow-x: auto;
    scroll-snap-type: x mandatory;
  }
}
</style>
