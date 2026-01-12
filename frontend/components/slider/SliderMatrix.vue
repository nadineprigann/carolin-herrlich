<script lang="ts" setup>
const props = defineProps<{
  items?: MatrixItem[]
}>()
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
// .slider-matrix {}
</style>
