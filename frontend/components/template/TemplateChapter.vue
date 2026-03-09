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

const { fields, breadcrumbs, nav } = toRefs(props.data)
</script>

<template>
  <main class="template-chapter">
    <BreadcrumbList :breadcrumbs="breadcrumbs" />
    <div class="header">
      <FieldText element="h2" :text="fields.title" class="title" />
      <FieldText
        v-if="fields.subtitle"
        element="h3"
        :text="fields.subtitle"
        class="subtitle"
      />
    </div>
    <FieldMatrix :items="fields.content" />
    <ChapterNav :items="nav" />
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
.template-chapter {
  padding: var(--page-spacing);
}

.header {
  margin-bottom: calc(var(--blank-line) * 2);
}

.title,
.subtitle {
  @include center-content;
  @include ff-sans;
  @include fs-xlarge;
}
</style>
