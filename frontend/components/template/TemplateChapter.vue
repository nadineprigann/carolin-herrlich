<script lang="ts" setup>
interface TemplateChapter extends Page {
  fields: {
    subtitle?: string
    image: Image
    content?: MatrixItem[]
    related_content?: RelatedContent
  }
}

const props = defineProps<{
  data: TemplateChapter
}>()

const { fields, breadcrumbs } = toRefs(props.data)
</script>

<template>
  <main class="template-chapter">
    <BreadcrumbList :breadcrumbs="breadcrumbs" />
    <FieldText element="h2" :text="fields.title" />
    <FieldText v-if="fields.subtitle" element="h3" :text="fields.subtitle" />
    <FieldMatrix :items="fields.content" />
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
// .template-chapter {}
</style>
