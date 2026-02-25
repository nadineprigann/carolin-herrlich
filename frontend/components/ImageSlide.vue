<script lang="ts" setup>
const props = defineProps<{
  slide: Image
  mode?: 'content' | 'overview' | 'default' | 'project'
  caption?: boolean
}>()

const isOverview = computed(() => props.mode === 'overview')
const isContent = computed(() => props.mode === 'content')

const modeClass = computed(() => {
  return {
    'is-content': isContent.value,
    'is-overview': isOverview.value,
  }
})
</script>

<template>
  <li class="image-slide" :class="modeClass">
    <FieldImage
      :image="props.slide"
      class="image"
      :mode="props.mode"
      :caption="props.caption"
    />
  </li>
</template>

<style lang="scss" scoped>
.image-slide {
  @include list-reset;

  width: 100%;
  height: 100%;

  &.is-content {
    display: inline-grid; /* shrink-wrap to content width */
    flex: 0 0 auto; /* prevent shrinking in flex container */
    scroll-snap-align: start;
    width: auto;
  }
}
</style>
