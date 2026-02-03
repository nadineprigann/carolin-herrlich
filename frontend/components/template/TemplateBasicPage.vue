<script lang="ts" setup>
interface TemplateBasicPage extends Page {
  fields: {
    subtitle?: string
    content?: MatrixItem[]
    related_content?: RelatedContent
  }
}

const props = defineProps<{
  data: TemplateBasicPage
}>()

const { fields, breadcrumbs } = toRefs(props.data)
</script>

<template>
  <main class="template-basic-page">
    <FieldText element="h2" :text="fields.title" />
    <FieldText v-if="fields.subtitle" element="h3" :text="fields.subtitle" />
    <BreadcrumbList :breadcrumbs="breadcrumbs" />
    <FieldMatrix :items="fields.content" />
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
// .template-basic-page {}
</style>
