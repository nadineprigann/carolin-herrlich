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
    <FieldText element="h2" :text="fields.title" class="title" />
    <FieldText
      v-if="fields.subtitle"
      element="h3"
      :text="fields.subtitle"
      class="subtitle"
    />
    <!-- <CategoryList :categories="fields.select_category" class="categories" /> -->
    <FieldMatrix :items="fields.content" />
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
// .template-tools {}

.title,
.subtitle,
.categories {
  @include center-content;
}

.title,
.subtitle {
  @include ff-sans;
}
</style>
