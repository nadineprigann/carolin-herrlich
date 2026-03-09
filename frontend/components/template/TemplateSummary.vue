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

const { fields, breadcrumbs, nav } = toRefs(props.data)

const labels = reactive({
  header: ' des Kapitels',
})
</script>

<template>
  <main class="template-summary">
    <div class="title-section">
      <BreadcrumbList :breadcrumbs="breadcrumbs" />
      <div class="header">
        <FieldText element="h2" :text="fields.title" class="title" />
        <FieldText element="h2" :text="labels.header" class="title" />
      </div>
    </div>
    <FieldTextarea v-if="fields.text" :text="fields.text" class="text" />
    <ChapterNav :items="nav" />
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
.template-summary {
  @include center-content;

  padding: var(--page-spacing);
}

.header {
  margin-bottom: calc(var(--blank-line) * 2);
}

.title {
  @include ff-sans;
  @include fs-xlarge;
}

.text {
  margin-bottom: calc(var(--blank-line) * 2);
}
</style>
