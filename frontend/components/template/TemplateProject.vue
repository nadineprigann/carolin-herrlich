<script lang="ts" setup>
interface TemplateProject extends Page {
  fields: ProjectItem
}

const props = defineProps<{
  data: TemplateProject
}>()

const { fields } = toRefs(props.data)
</script>

<template>
  <main class="template-project">
    <FieldText element="h2" :text="fields.title" />
    <FieldText v-if="fields.subtitle" element="h3" :text="fields.subtitle" />
    <ImageSlider :slides="fields.images" />
    <RowList :table="fields.table" />
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
// .template-project {}
</style>
