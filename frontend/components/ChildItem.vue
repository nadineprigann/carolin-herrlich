<script lang="ts" setup>
import { useRoute } from 'vue-router'
const route = useRoute()

const props = defineProps<{
  child: childItem
}>()

// TODO: fix computed property to return boolean
const showChild = computed(() => {
  return props.child?.fields && props.child?.meta
})

const isEvent = computed(() => {
  return props.child?.meta.template === 'event'
})

const showDescription = computed(() => {
  return isEvent.value && props.child?.fields.long_description.length > 0
})

// save current list filters in navigation state when linking to detail page
const linkTo = computed(() => {
  return {
    path: props.child.meta.url,
    state: { listFilters: { ...route.query } },
  }
})
</script>

<template>
  <li class="child-item">
    <NuxtLink v-if="showChild" :to="linkTo" class="link">
      <FieldText element="h5" class="title" :text="props.child.fields.title" />
      <FieldTextarea
        v-if="showDescription"
        class="description"
        :text="props.child.fields.long_description"
      />
      <CategoryList :categories="props.child.fields.select_category" />
    </NuxtLink>
  </li>
</template>

<style lang="scss" scoped>
.child-item {
  // @include link-default;
}
</style>
