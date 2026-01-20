<script lang="ts" setup>
import { useRoute } from 'vue-router'

const props = defineProps<{
  item: OverviewItem
}>()

const route = useRoute()

// custom link for overview item when it has template category
const linkTo = computed(() => {
  // Destructure meta bject to only get the needed properties
  const { template, url } = props.item.meta

  // Normal page navigation
  if (template === 'basic-page') {
    return url
  }

  // Category → apply filter
  if (template === 'category') {
    // console.log('category link for overview item', route.path)
    return {
      path: route.path + 'werkzeuge/',
      query: {
        category: props.item.meta.name,
      },
    }
  }

  // No link if none of the above matched
  return null
})
</script>

<template>
  <FieldImage :image="props.item.fields.image" />
  <NuxtLink :to="linkTo" class="nav-item">
    <div class="overviewitem" v-html="props.item.fields.title" />
  </NuxtLink>
</template>

<style lang="scss" scoped>
.item-item {
  // @include link-default;
}
</style>
