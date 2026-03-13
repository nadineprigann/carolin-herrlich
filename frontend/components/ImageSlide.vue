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

const sizes = computed(() => {
  if (isContent.value) {
    return '(min-width: 80em) 55vw, (min-width: 48em) 70vw, 85vw'
  }
  return '(min-width: 80em) 94vw, (min-width: 48em) 95vw, 94vw'
})
</script>

<template>
  <li class="image-slide" :class="modeClass">
    <FieldImage
      :image="props.slide"
      class="image"
      :mode="props.mode"
      :caption="props.caption"
      :sizes="sizes"
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

    &:not(:last-of-type) {
      margin-right: var(--gutter-base);
    }

    @media (min-width: $tablet) {
      &:not(:last-of-type) {
        margin-right: var(--gutter-m);
      }
    }
  }
}
</style>
