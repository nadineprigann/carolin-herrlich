<script lang="ts" setup>
const breakpointsStore = useBreakpointsStore()
const { isMedium } = storeToRefs(breakpointsStore)

interface TemplateOverview extends Page {
  fields: {
    meta_description: string
    text: string
    related_content: RelatedContent
  }
  children: OverviewItem[] // child pages like on grundlagen overview page etc.
  items: OverviewItem[] // categories like on tools overview page
}

const props = defineProps<{
  data: TemplateOverview
}>()

const { fields, children, items, breadcrumbs } = toRefs(props.data)

const labels = reactive({
  info: 'Infos zu dieser Seite',
})

const hasChildren = computed(() => {
  return children?.value?.length > 0
})

const hasItems = computed(() => {
  return items?.value?.length > 0
})

const infoVisible = ref(false)

function showInfo() {
  infoVisible.value = !infoVisible.value
}

const coverImages = computed(() => {
  const images = []
  if (!hasChildren.value) return
  children.value.forEach((child) => images.push(child.fields.image))
  return images
})

const showSlider = computed(() => {
  return coverImages.value.length > 0 && !isMedium.value
})

onDeactivated(() => {
  infoVisible.value = false
})
</script>

<template>
  <main class="template-overview">
    <BreadcrumbList :breadcrumbs="breadcrumbs" />
    <FieldText element="h2" :text="fields.title" />
    <section class="info-section">
      <FieldText
        element="h4"
        class="label"
        :text="labels.info"
        @click="showInfo"
      />
      <FieldTextarea v-show="infoVisible" :text="fields.text" />
    </section>
    <ImageSlider v-if="showSlider" :slides="coverImages" />
    <OverviewList v-if="hasChildren" :items="children" />
    <OverviewList v-if="hasItems" :items="items" />
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
// .template-overview {}
</style>
