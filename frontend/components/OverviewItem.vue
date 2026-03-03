<script lang="ts" setup>
import { useRoute } from 'vue-router'
const emit = defineEmits(['current-item'])
const formStore = useFormStore()
const { selected } = storeToRefs(formStore)
// const { setQuery } = useUpdateQuery()

const props = defineProps<{
  item: OverviewItem
}>()

const route = useRoute()

const categoryObject = computed<PageReference>(() => ({
  // create category object from item by using its props and type it as PAgeRefernece (category). this way, its guaranteed that the type always matches. this type is also use dfor filters in filter overlay.
  title: props.item.fields.title,
  meta: {
    alternate: props.item.meta.alternate,
    id: props.item.meta.id,
    name: props.item.meta.name,
    template: props.item.meta.template,
    url: props.item.meta.url,
  },
}))

// custom link for overview item when it has template category
const linkTo = computed(() => {
  // Destructure meta bject to only get the needed properties
  // const { template, url } = props.item.meta

  // if no url is present, return null
  if (!props.item.meta.url) return null
  return route.path + 'werkzeuge/'

  // if template category, build link with query param
  // if (template === 'category') {
  //   return {
  //     path: route.path + 'werkzeuge/',
  //     query: {
  //       filter: props.item.meta.name,
  //       // for when multiple filters are needed in the future. keep existing filters with ...route.query and add other filters and categories to it
  //       // ...route.query,
  //       // category: 'tools',
  //       // tag: 'permakultur',
  //       // sort: 'date',
  //     },
  //   }
  //   // Normal page navigation
  // } else return url
})

const onNavigateCategory = () => {
  // set selected category in store to keep filters synced in a central place.
  if (props.item.meta.template !== 'category') return
  selected.value.categories = [categoryObject.value]
  // const targetPath = route.path + 'werkzeuge/'
  // const filterName = props.item.meta.name
  // setQuery()
  // await setQuery([filterName], targetPath)
}

function getCurrentItem() {
  emit('current-item', props.item)
}

function resetCurrentItem() {
  emit('current-item', null)
}
</script>

<template>
  <li
    class="overview-item"
    @mouseenter="getCurrentItem"
    @mouseleave="resetCurrentItem"
  >
    <NuxtLink :to="linkTo" class="link" @click="onNavigateCategory">
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
}
</style>
