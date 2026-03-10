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
    <div class="header">
      <FieldText element="h2" :text="fields.title" class="title" />
      <FieldText
        v-if="fields.subtitle"
        element="h3"
        :text="fields.subtitle"
        class="subtitle"
      />
    </div>
    <!-- <CategoryList :categories="fields.select_category" class="categories" /> -->
    <FieldMatrix :items="fields.content" />
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
.template-tool {
  padding: var(--page-spacing);
}

.title,
.subtitle,
.categories {
  @include center-content;
}

.header {
  margin-bottom: var(--gutter-xl);

  @media (min-width: $medium) {
    margin-bottom: calc(var(--gutter-base) * 5);
  }
}

.title,
.subtitle {
  @include ff-sans;
  @include fs-xlarge;
}
</style>
