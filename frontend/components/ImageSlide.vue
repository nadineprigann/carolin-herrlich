<script lang="ts" setup>
const props = defineProps<{
  slide: Image
  mode?: 'content' | 'overview' | 'default'
  showCaption?: boolean
}>()

const modeClass = computed(() => {
  return {
    'is-content': props.mode === 'content',
    'is-overview': props.mode === 'overview',
  }
})
</script>

<template>
  <li class="image-slide" :class="modeClass">
    <FieldImage
      :image="props.slide"
      class="image"
      :mode="props.mode"
      :show-caption="props.showCaption"
    />
    <!-- <div class="child-title" v-text="props.child.fields.title" /> -->
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
    width: auto;
    scroll-snap-align: start;
  }
}
</style>
