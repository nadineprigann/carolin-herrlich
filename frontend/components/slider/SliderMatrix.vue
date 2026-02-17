<script lang="ts" setup>
const props = defineProps<{
  items?: MatrixItem[]
}>()

const currentSlide = ref(0)
let interval: number | undefined
const delay = 3000

const firstSlide = computed(() => props.items?.[0])
const slideCount = computed(() => props.items?.length)
const lastSlide = computed(() => currentSlide.value === slideCount.value - 1)

const prev = () => {
  if (firstSlide.value) {
    currentSlide.value = slideCount.value - 1
  } else {
    currentSlide.value--
  }
}

const next = () => {
  currentSlide.value = (currentSlide.value + 1) % slideCount.value
}

const autoplay = () => {
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
  <div v-if="props.items?.length" class="slider-matrix">
    <SliderMatrixItem
      v-for="(item, index) in props.items"
      :key="`item-${index}`"
      :item="item"
    />
  </div>
</template>

<style lang="scss" scoped>
.slider-matrix {
  position: relative;
  flex: 1 1 0; // allow to grow and shrink, but start at 0 to prevent overflow when there are no items
  min-height: 0;
}
</style>
