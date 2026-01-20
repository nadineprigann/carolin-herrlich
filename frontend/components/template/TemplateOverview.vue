<script lang="ts" setup>
interface TemplateOverview extends Page {
  fields: {
    meta_description: string
    text: string
    related_content: RelatedContent
  }
  children: OverviewItem[]
}

const props = defineProps<{
  data: TemplateOverview
}>()

const { fields, children } = toRefs(props.data)

const labels = reactive({
  info: 'Infos zu dieser Seite',
})
</script>

<template>
  <main class="template-overview">
    <FieldText element="h2" :text="fields.title" />
    <div class="info-section">
      <div class="label" v-html="labels.info" />
      <FieldText :text="fields.text" />
    </div>
    <OverviewList :items="children" />
    <!-- <RelatedContent :related="fields.related_content" /> -->
  </main>
</template>

<style lang="scss" scoped>
// .template-overview {}
</style>
