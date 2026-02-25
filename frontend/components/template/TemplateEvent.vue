<script lang="ts" setup>
interface TemplateEvent extends Page {
  fields: childItem
  external_link: string
  external_link_title: string
}

const props = defineProps<{
  data: TemplateEvent
}>()

const { fields, breadcrumbs } = toRefs(props.data)
</script>

<template>
  <main class="template-event">
    <BreadcrumbList :breadcrumbs="breadcrumbs" />
    <FieldText
      v-if="fields.subtitle"
      element="h3"
      :text="fields.subtitle"
      class="subtitle"
    />
    <FieldText element="h2" :text="fields.title" class="title" />
    <FieldMatrix :items="fields.content" />
    <section class="sign-up">
      <OverlayButton
        v-if="fields.external_link"
        :url="fields.external_link"
        :label="fields.external_link_title"
      />
      <CheckOutOverlay :title="fields.title" />
    </section>
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
// .template-event {}
.title,
.subtitle,
.sign-up {
  @include center-content;
}
</style>
