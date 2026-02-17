<script lang="ts" setup>
interface TemplateTool extends Page {
  fields: childItem
}

const props = defineProps<{
  data: TemplateTool
}>()

const { fields, breadcrumbs } = toRefs(props.data)
</script>

<template>
  <main class="template-tool">
    <BreadcrumbList :breadcrumbs="breadcrumbs" />
    <FieldText element="h2" :text="fields.title" />
    <FieldText v-if="fields.subtitle" element="h3" :text="fields.subtitle" />
    <FieldMatrix :items="fields.content" />
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
// .template-tools {}
</style>
