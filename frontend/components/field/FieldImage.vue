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
// // const imageWidth = ref(0)

const imageElement = ref<HTMLImageElement | null>(null)
const isLoaded = ref(false)

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
    'is-loaded': isLoaded.value,
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

const imgSrc = computed(() => {
  return props.image?.urls?.[0]?.url ?? ''
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

const onLoaded = () => {
  isLoaded.value = true
}

const syncLoadedState = () => {
  // check actual DOM element if its there, no reference with src > cleaner
  const img = imageElement.value
  isLoaded.value = !!(img && img.complete && img.naturalWidth > 0) // if img already finished loading, mark it loaded immediately. syntax: img.complete && img.naturalWidth > 0 are native brwoser props and mean its not broken cuz width is larger than 0 and the browser is done loading (complete).
  // double negation to convert to boolean: only true if img exists, otherwise false
}

// const imageWidthStyle = computed(() => {
//   if (!isContent.value) return {}
//   // if (imageWidth.value) {
//   //   return { width: `${imageWidth.value}px` }
//   // }
//   return imageWidth.value ? { '--media-w': `${imageWidth.value}px` } : {}
// })

onMounted(() => {
  syncLoadedState() // if image is already loaded (e.g. from cache), set loaded state to true immediately. if not, it will be set in the onLoad handler. this is necessary to avoid issues with SSR and hydration where the image might already be loaded before the onLoad event can fire, which would cause the component to never update to the loaded state.
  //   if (!isContent.value) return

  //   if (imageElement.value?.complete && imageElement.value.naturalWidth > 0) {
  //     // image already loaded (cached / SSR); run handler manually
  //     onImageLoad()
  //   }
})

watch(imageElement, () => {
  // if image ref in the DOM changes (= new image), set loaded to false and check if this image is already loaded (e.g. from cache) if so, update the opacity accordingly. if not, image gets loaded on @load and then changes its opacity. this makes sure that everything is visible, e.g. when the same component instance is reused for a different image, e.g. in a slider or when the image source changes.
  isLoaded.value = false // make sure to start every instance with opacity 0. prevent state inheritance.
  syncLoadedState()
})
</script>

<template>
  <!-- :style="imageWidthStyle" -->
  <figure v-if="props.image" class="field-image" :class="modeClass">
    <img
      v-if="props.image && props.image.resized"
      ref="imageElement"
      :src="imgSrc"
      :srcset="srcset"
      :sizes="sizes"
      :loading="props.loading"
      :alt="props.image.alt_text"
      :aria-describedby="longDescId"
      class="image"
      @load="onLoaded"
    />
    <img
      v-else-if="props.image && !props.image.resized"
      ref="imageElement"
      :src="imgSrc"
      :loading="props.loading"
      :alt="props.image.alt_text"
      :aria-describedby="longDescId"
      class="image"
      @load="onLoaded"
    />
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
    background-color: var(--white);
    opacity: 0;
    transition: opacity var(--xshort) ease-in;

    // object-fit: cover;
  }

  &.is-loaded {
    img {
      opacity: 1;
    }
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
