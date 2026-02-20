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

// const isOverview = computed(() => props.mode === 'overview')
// const isContent = computed(() => props.mode === 'content')

// const image = ref<{ imageElement: HTMLImageElement | null } | null>(null)
// const imageWidth = ref(0)

// const handleImageWidth = (width: number) => {
//   imageWidth.value = width
//   console.log('width', width)
// }

// const loadingMode = computed(() => (isContent.value ? 'eager' : 'lazy'))

// const imageWidthStyle = computed(() => {
//   // if (imageWidth.value) {
//   //   return { width: `${imageWidth.value}px` }
//   // }
//   return imageWidth.value ? { '--media-w': `${imageWidth.value}px` } : {}
// })

// const getImageWidth = () => {
//   if (!image.value?.imageElement) return
//   imageWidth.value = Math.round(
//     image.value.imageElement.getBoundingClientRect().width,
//   )
//   console.log('Image:', image.value.imageElement)
// }

onMounted(() => {
  // if (isContent.value)
  // getImageWidth()
})

onActivated(() => {
  // if (isContent.value)
  // getImageWidth()
})
</script>
<template>
  <!-- :style="imageWidthStyle" -->
  <li class="image-slide" :class="modeClass">
    <FieldImage
      :image="props.slide"
      class="image"
      :mode="props.mode"
      :show-caption="props.showCaption"
    />
    <!-- @image-width="handleImageWidth" -->
    <!-- :loading="loadingMode" -->
    <!-- <div class="child-title" v-text="props.child.fields.title" /> -->
  </li>
</template>

<style lang="scss" scoped>
.image-slide {
  @include list-reset;

  width: 100%;
  height: 100%;

  // &.is-overview {
  //   width: 100%;
  //   height: 100%;
  // }

  &.is-content {
    display: inline-grid; /* shrink-wrap to content width */
    flex: 0 0 auto; /* prevent shrinking in flex container */
    scroll-snap-align: start;
    width: auto;

    // width: var(--media-w, auto);
    // max-width: 50%;
  }
}
</style>
