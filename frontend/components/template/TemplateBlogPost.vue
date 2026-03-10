<script lang="ts" setup>
interface TemplateBlogPost extends Page {
  fields: childItem
}

const props = defineProps<{
  data: TemplateBlogPost
}>()

const { fields, breadcrumbs } = toRefs(props.data)
</script>

<template>
  <main class="template-blog-post">
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
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
.template-blog-post {
  padding: var(--page-spacing);
}

.header {
  margin-bottom: var(--gutter-xl);

  @media (min-width: $medium) {
    margin-bottom: calc(var(--gutter-base) * 5);
  }
}

.title,
.subtitle {
  @include center-content;
  @include ff-sans;
  @include fs-xlarge;
}
</style>
