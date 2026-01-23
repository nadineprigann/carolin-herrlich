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
    <FieldText v-if="fields.subtitle" element="h2" :text="fields.subtitle" />
    <FieldMatrix :items="fields.content" />
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
// .template-project {}
</style>
