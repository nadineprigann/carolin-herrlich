<script lang="ts" setup>
import { useRoute } from 'vue-router'
const emit = defineEmits(['current-item'])

const props = defineProps<{
  item: OverviewItem
}>()

const route = useRoute()

// custom link for overview item when it has template category
const linkTo = computed(() => {
  // Destructure meta bject to only get the needed properties
  const { template, url } = props.item.meta

  // if no url is present, return null
  if (!props.item.meta.url) return null

  // if template category, build link with query param
  if (template === 'category') {
    return {
      path: route.path + 'werkzeuge/',
      query: {
        filter: props.item.meta.name,
        // for when multiple filters are needed in the future. keep existing filters with ...route.query and add other filters and categories to it
        // ...route.query,
        // category: 'tools',
        // tag: 'permakultur',
        // sort: 'date',
      },
    }
    // Normal page navigation
  } else return url
})

function getCurrentItem() {
  emit('current-item', props.item)
}

function resetCurrentItem() {
  emit('current-item', null)
}
</script>

<template>
  <li class="overview-item" @mouseenter="getCurrentItem">
    <!-- @mouseleave="resetCurrentItem" -->
    <!-- <FieldImage
      :image="props.item.fields.image"
      class="image"
      :show_caption="false"
    /> -->
    <NuxtLink :to="linkTo" class="link">
      <FieldText class="title" element="h5" :text="props.item.fields.title" />
    </NuxtLink>
  </li>
</template>

<style lang="scss" scoped>
.overview-item {
  // @include link-default;
}

.link {
  @include link-default;

  position: relative;
  z-index: 1;
}
</style>
