<script lang="ts" setup>
import { useId } from 'vue'
interface Props {
  image: Image
  sizes?: string
  loading?: 'eager' | 'lazy'
  showCaption?: boolean
}

const props = withDefaults(defineProps<Props>(), {
  sizes: '100vw',
  loading: 'lazy',
  showCaption: true,
})

const modeClass = computed(() => {
  return {
    'is-portrait': isPortrait.value,
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
  <figure v-if="props.image" class="field-image">
    <img
      v-if="props.image && props.image.resized"
      :srcset="srcset"
      :sizes="sizes"
      :loading="props.loading"
      :alt="props.image.alt_text"
      :aria-describedby="longDescId"
      :class="modeClass"
      class="image"
    />
    <img
      v-else-if="props.image && !props.image.resized"
      :src="props.image.urls[0].url"
      :loading="props.loading"
      :alt="props.image.alt_text"
      :aria-describedby="longDescId"
      :class="modeClass"
      class="image"
    />
    <figcaption :class="figCaptionClass" class="image-caption">
      <span class="caption">{{ props.image.caption }}</span>
      <a class="link" :href="props.image.external_link">
        <span> © {{ props.image.external_link_title }}</span>
      </a>
      <span v-if="props.image.year" class="year">, {{ props.image.year }}</span>
      <span class="license"
        >.&nbsp;{{ text.license }}{{ props.image.license.fields.title }}.
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
// .field-image {}
.image-caption {
  &.is-hidden {
    @include visually-hidden;
  }
}

.long-description {
  @include visually-hidden;
}
</style>
