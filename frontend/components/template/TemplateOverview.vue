<script lang="ts" setup>
interface TemplateOverview extends Page {
  fields: {
    meta_description: string
    text: string
    related_content: {
      context: string
      in_depth: []
    }
  }
  children: OverviewItem[]
}

const props = defineProps<{
  data: TemplateOverview
}>()

const { fields, children } = toRefs(props.data)
</script>

<template>
  <main class="template-overview">
    <FieldText element="h2" :text="fields.title" />
    <!-- Infos zu dieser Seite, auch i18n bedenken! -->
    <FieldText :text="fields.text" />
    <OverviewList :items="children" />
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
// .template-overview {}
</style>
