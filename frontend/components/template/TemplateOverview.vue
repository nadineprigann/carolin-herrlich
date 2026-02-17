<script lang="ts" setup>
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

const showChildren = computed(() => {
  return children?.value?.length > 0
})

const showItems = computed(() => {
  return items?.value?.length > 0
})

const infoVisible = ref(false)

function showInfo() {
  infoVisible.value = !infoVisible.value
}

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
    <OverviewList v-if="showChildren" :items="children" />
    <OverviewList v-if="showItems" :items="items" />
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
// .template-overview {}
</style>
