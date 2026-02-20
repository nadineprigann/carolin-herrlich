<script lang="ts" setup>
import { useId } from 'vue'
interface Props {
  image: Image
  sizes?: string
  loading?: 'eager' | 'lazy'
  showCaption?: boolean
  mode?: 'content' | 'overview' | 'default'
}

const props = withDefaults(defineProps<Props>(), {
  sizes: '100vw',
  loading: 'lazy',
  showCaption: true,
  mode: 'default',
})

const modeClass = computed(() => {
  return {
    'is-portrait': isPortrait.value,
    'is-content': props.mode === 'content',
    'is-overview': props.mode === 'overview',
  }
})

const figCaptionClass = computed(() => {
  return {
    'is-hidden': !props.showCaption,
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

const text = computed(() => {
  return {
    license: 'Lizenz:  ',
  }
})

// create unique ssr-safe id for aria-describedby. comes from vue 3.3 core.
const id = useId()

// show long description id only if long description exists to make it ARIA valid
const longDescId = computed(() => {
  return props.image?.long_description?.length ? `long-description-${id}` : null
})
</script>

<template>
  <figure v-if="props.image" class="field-image" :class="modeClass">
    <img
      v-if="props.image && props.image.resized"
      :srcset="srcset"
      :sizes="sizes"
      :loading="props.loading"
      :alt="props.image.alt_text"
      :aria-describedby="longDescId"
      class="image"
    />
    <img
      v-else-if="props.image && !props.image.resized"
      :src="props.image.urls[0].url"
      :loading="props.loading"
      :alt="props.image.alt_text"
      :aria-describedby="longDescId"
      class="image"
    />
    <figcaption :class="figCaptionClass" class="image-caption">
      <span class="caption">{{ props.image.caption }}</span>
      <a class="link" :href="props.image.external_link">
        <span> © {{ props.image.external_link_title }}. </span>
      </a>
      <span v-if="props.image.year" class="year">, {{ props.image.year }}</span>
      <span class="license"
        >{{ text.license }}{{ props.image.license.fields.title }}.
      </span>
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
.field-image {
  display: grid;
  grid-template-rows: minmax(0, 1fr) auto; // image gets the rest, content gets space as intrinsically needed
  height: 100%;
  min-height: 0; // allow image to shrink within the grid

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

  // slider auf overview-pages on mobile
  &.is-overview {
    width: 100%;
    height: 100%;

    img {
      height: 100%;
      object-fit: contain;
    }
  }

  &.is-content {
    img {
      display: block;
      width: auto;
      height: 100%;
    }
  }
}

.image-caption {
  // width: 100%;
  // max-width: max-content;

  // word-break: break-word;
  // overflow-wrap: anywhere;

  .is-slider & {
    width: 100%;
    word-break: break-word;
    overflow-wrap: anywhere;
  }

  &.is-hidden {
    @include visually-hidden;
  }
}

.long-description {
  @include visually-hidden;
}
</style>
