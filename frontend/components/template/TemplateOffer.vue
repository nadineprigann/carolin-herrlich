<script lang="ts" setup>
interface TemplateOffer extends Page {
  fields: {
    meta_description: string
    content: MatrixItem[]
  }
}

const props = defineProps<{
  data: TemplateOffer
}>()

const { fields, breadcrumbs, nav } = toRefs(props.data)
</script>

<template>
  <main class="template-offer">
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
  </main>
</template>

<style lang="scss" scoped>
.template-offer {
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
