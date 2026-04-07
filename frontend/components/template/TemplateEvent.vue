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
    <div class="header">
      <FieldText element="h2" :text="fields.title" class="title" />
      <FieldText
        v-if="fields.subtitle"
        element="h3"
        :text="fields.subtitle"
        class="subtitle"
      />
      <div v-if="fields.date_start" class="dates">
        <span class="date-start" v-text="fields.date_start?.formatted?.full" />
        <span
          v-if="fields.date_end"
          class="date-end"
          v-text="fields.date_end.formatted.full"
        />
      </div>
    </div>
    <FieldMatrix :items="fields.content" />
    <section class="sign-up">
      <OverlayButton
        v-if="fields.external_link"
        :url="fields.external_link"
        :label="fields.external_link_title"
        :overlay="'checkout'"
      />
      <CheckOutOverlay :title="fields.title" />
    </section>
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
.template-event {
  padding: var(--page-spacing);
}

.title,
.subtitle,
.dates,
.sign-up {
  @include center-content;
}

.header {
  margin-bottom: calc(var(--blank-line) * 2);
}

.title,
.subtitle,
.date-start,
.date-end {
  @include ff-sans;
  @include fs-xlarge;
}

.date-end {
  &::before {
    content: ' – ';
  }
}

.sign-up {
  margin-bottom: var(--page-end);
}
</style>
