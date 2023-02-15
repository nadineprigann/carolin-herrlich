<script lang="ts" setup>
interface Props {
  image: Image
  sizes?: string
  loading?: string
}

const props = withDefaults(defineProps<Props>(), {
  sizes: '100vw',
  loading: 'lazy',
})

const classes = computed(() => {
  return {
    'is-portrait': isPortrait.value,
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
</script>

<template>
  <img
    v-if="props.image && props.image.resized"
    :srcset="srcset"
    :sizes="sizes"
    :loading="props.loading"
    :alt="props.image.description"
    :class="classes"
    class="base-image"
  />
  <img
    v-else-if="props.image && !props.image.resized"
    :src="props.image.urls[0].url"
    :loading="props.loading"
    :alt="props.image.description"
    :class="classes"
    class="base-image"
  />
</template>

<style lang="scss" scoped>
// .base-image {}
</style>
