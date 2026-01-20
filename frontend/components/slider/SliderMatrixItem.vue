<script lang="ts" setup>
const props = defineProps<{
  item: MatrixItem
}>()

// Pick component based on matrix type
// TODO: Ideally, this would be possible by just passing the component name as a string
// see https://nuxt.com/docs/guide/directory-structure/components/#dynamic-components
const SliderMatrixTypeHomeSlide = resolveComponent('SliderMatrixTypeHomeSlide')
// Register new types here...

const type = computed(() => {
  if (props.item.type === 'type_home_slide') return SliderMatrixTypeHomeSlide
  // ... and match them here
})
</script>

<template>
  <component :is="type" :item="item" class="slider-matrix-item" />
</template>

<style lang="scss" scoped>
// .slider-matrix-item {}
</style>
