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

  // if no url is present, return null
  if (!props.item.meta.url) return null

  // if template category, build link with query param
  if (template === 'category') {
    // console.log('category link for overview item', route.path)
    return {
      path: route.path + 'werkzeuge/',
      query: {
        category: props.item.meta.name,
      },
    }
    // Normal page navigation
  } else return url
})
</script>

<template>
  <FieldImage :image="props.item.fields.image" />
  <NuxtLink :to="linkTo" class="nav-item">
    <div class="overviewitem" v-text="props.item.fields.title" />
  </NuxtLink>
</template>

<style lang="scss" scoped>
.item-item {
  // @include link-default;
}
</style>
