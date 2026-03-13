<script lang="ts" setup>
import { useId } from 'vue'
interface Props {
  image: Image
  sizes?: string
  loading?: 'eager' | 'lazy'
  caption?: boolean
  mode?: 'content' | 'overview' | 'default' | 'projects' | 'project'
}

const props = withDefaults(defineProps<Props>(), {
  sizes: '100vw',
  loading: 'lazy',
  caption: true,
  mode: 'default',
})

// vw = (element width / viewport width) * 100

// const emit = defineEmits<{
//   (e: 'image-width', width: number): void
// }>()
// const imageElement = ref<HTMLImageElement | null>(null)
// // const imageWidth = ref(0)

const isOverview = computed(() => props.mode === 'overview')
const isContent = computed(() => props.mode === 'content')
const isProjects = computed(() => props.mode === 'projects')
const isProject = computed(() => props.mode === 'project')

const modeClass = computed(() => {
  return {
    'is-portrait': isPortrait.value,
    'is-content': isContent.value,
    'is-overview': isOverview.value,
    'is-projects': isProjects.value,
    'is-project': isProject.value,
  }
})

const figCaptionClass = computed(() => {
  return {
    'is-hidden': !props.caption,
  }
})

const isPortrait = computed(() => {
  return props.image.ratio < 1
})

const srcset = computed(() => {
  return Object.values(props.image.urls)
    .map((item) => {
      return `${item.url} ${item.width}w`
    })
    .join(',')
})

// const text = computed(() => {
//   return {
//     license: 'Lizenz:  ',
//   }
// })

// create unique ssr-safe id for aria-describedby. comes from vue 3.3 core.
const id = useId()

// show long description id only if long description exists to make it ARIA valid
const longDescId = computed(() => {
  return props.image?.long_description?.length ? `long-description-${id}` : null
})

// const onImageLoad = async () => {
//   if (!isContent.value) return
//   await nextTick() // ensures layout is settled
//   // nextTick(() => {
//   if (!imageElement.value) return
//   const width = Math.round(imageElement.value.getBoundingClientRect().width)
//   emit('image-width', width)
//   console.log('image loaded')
//   // })
// }

// const imageWidthStyle = computed(() => {
//   if (!isContent.value) return {}
//   // if (imageWidth.value) {
//   //   return { width: `${imageWidth.value}px` }
//   // }
//   return imageWidth.value ? { '--media-w': `${imageWidth.value}px` } : {}
// })

// onMounted(async () => {
//   if (!isContent.value) return
//   await nextTick()
//   if (imageElement.value?.complete && imageElement.value.naturalWidth > 0) {
//     // image already loaded (cached / SSR); run handler manually
//     onImageLoad()
//   }
// })
</script>

<template>
  <!-- :style="imageWidthStyle" -->
  <figure v-if="props.image" class="field-image" :class="modeClass">
    <img
      v-if="props.image && props.image.resized"
      ref="imageElement"
      :srcset="srcset"
      :sizes="sizes"
      :loading="props.loading"
      :alt="props.image.alt_text"
      :aria-describedby="longDescId"
      class="image"
    />
    <!-- @load="onImageLoad" -->
    <img
      v-else-if="props.image && !props.image.resized"
      ref="imageElement"
      :src="props.image.urls[0].url"
      :loading="props.loading"
      :alt="props.image.alt_text"
      :aria-describedby="longDescId"
      class="image"
    />
    <!-- @load="onImageLoad" -->
    <figcaption :class="figCaptionClass" class="image-caption">
      <span class="caption">{{ props.image.caption }}</span>
      <a class="link" :href="props.image.external_link">
        <span> © {{ props.image.external_link_title }}</span>
      </a>
      <span v-if="props.image.year" class="year">, {{ props.image.year }}</span>
      <!-- {{ text.license }} -->
      <span class="license">. {{ props.image.license.fields.title }}. </span>
    </figcaption>
    <p
      v-if="props.image.long_description.length"
      :id="longDescId"
      class="long-description"
    >
      {{ props.image.long_description }}
    </p>
  </figure>
</template>

<style lang="scss" scoped>
// TODO: how to handle overrides better? CSS vars or more generic props or a combi? https://chatgpt.com/c/699c3bbb-3ec4-838a-a951-848a3bb43c72
.field-image {
  display: grid;
  grid-template-rows: minmax(0, 1fr) auto; // image gets the rest, content gets space as intrinsically needed
  height: 100%;
  min-height: 0; // allow image to shrink within the grid
  // note: no gap to avoid white area bc images are used without caption sometimes
  img {
    display: block;
    width: 100%;
    min-width: 0;
    height: auto;
    min-height: 0;

    // object-fit: cover;
  }

  // &.is-portrait {
  //   width: auto;
  //   height: 100%;

  //   // margin: 0 auto;

  //   img {
  //     width: auto;
  //     height: 100%;
  //   }
  // }

  // slider auf overview-pages on mobile. project can't use the same prop bc we change CSS upstream in ImageSlider.vue and ImageSlide.vue. also, separations of concerns.
  &.is-overview,
  &.is-project {
    width: 100%;
    height: 100%;

    img {
      height: 100%;
      object-fit: contain;
    }
  }

  &.is-project {
    gap: calc(var(--gutter-base) * 5) 0;

    @media (min-width: $tablet) {
      gap: calc(var(--gutter-base) * 10) 0;
    }
  }

  // content slider from repeater-matrix
  &.is-content {
    img {
      display: block;
      width: auto;
      height: 100%;
    }
  }

  // projects-overview
  &.is-projects {
    img {
      align-self: start;
      max-width: 100%;

      // height: 100%;
      object-fit: cover;
    }

    &.is-portrait {
      img {
        object-fit: contain;
      }
    }

    @media (min-width: $mobile) {
      &.is-portrait {
        img {
          object-fit: cover;
        }
      }
    }
  }
}

.image-caption {
  @include fs-xsmall; // should be set on single elements

  margin-top: calc(
    var(--gutter-base) / 2
  ); // use as space instead of gap to avoid white area when caption is hidden
  // width: 100%;
  // max-width: max-content;

  word-break: break-word;
  overflow-wrap: anywhere;

  // .is-content & {
  //   width: 100%;
  //   word-break: break-word;
  //   overflow-wrap: anywhere;
  // }

  &.is-hidden {
    @include visually-hidden;
  }
}

.long-description {
  @include visually-hidden;
}
</style>
