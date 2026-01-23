<script lang="ts" setup>
interface TemplateSummary extends Page {
  fields: {
    text: string
    related_content: RelatedContent
  }
}

const props = defineProps<{
  data: TemplateSummary
}>()

const { fields } = toRefs(props.data)

const labels = reactive({
  header: ' des Kapitels',
})
</script>

<template>
  <main class="template-summary">
    <div class="title-section">
      <FieldText element="h2" :text="fields.title" class="title" />
      <FieldText element="h2" :text="labels.header" class="title" />
    </div>
    <FieldTextarea v-if="fields.text" :text="fields.text" />
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
// .template-summary {}
</style>
