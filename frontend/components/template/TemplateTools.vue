<script lang="ts" setup>
import { useRoute } from 'vue-router'

interface TemplateTools extends Page {
  children: childItem[]
}

const props = defineProps<{
  data: TemplateTools
}>()

const { fields } = toRefs(props.data)
const route = useRoute()

const label = reactive({
  random: 'Zufällige Einträge',
  all: 'Alle',
})

// use route query to set list title if filtered by category
const listTitle = computed(() => {
  return route.query.category
    ? route.query.category.charAt(0).toUpperCase() +
        route.query.category.slice(1)
    : label.all
})

const randomChildren = computed(() => {
  return props.data.children
    .slice()
    .sort(() => 0.5 - Math.random())
    .slice(0, 3)
})

const showChildren = computed(() => {
  return props.data.children?.length > 0
})

const showRandomChildren = computed(() => {
  return props.data.children?.length > 3
})
</script>

<template>
  <main class="template-tools">
    <FieldText element="h2" :text="fields.title" />
    <div>
      <FieldText class="random-label" element="h3" :text="listTitle" />
      <ChildList v-if="showChildren" :children="props.data.children" />
    </div>
    <div>
      <FieldText class="random-label" element="h3" :text="label.random" />
      <ChildList v-if="showRandomChildren" :children="randomChildren" />
    </div>
  </main>
</template>

<style lang="scss" scoped>
// .template-tools {}
</style>
