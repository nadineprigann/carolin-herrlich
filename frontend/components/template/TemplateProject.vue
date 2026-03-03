<script lang="ts" setup>
interface TemplateProject extends Page {
  fields: ProjectItem
}

const props = defineProps<{
  data: TemplateProject
}>()

const { fields, breadcrumbs } = toRefs(props.data)

const label = reactive({
  header: 'Projektinfos',
})
</script>

<template>
  <main class="template-project">
    <section class="slideshow">
      <BreadcrumbList :breadcrumbs="breadcrumbs" />
      <FieldText element="h2" :text="fields.title" class="title" />
      <!-- <FieldText
        v-if="fields.subtitle"
        element="h3"
        :text="fields.subtitle"
        class="subtitle"
      /> -->
      <ImageSlider
        :slides="fields.images"
        class="slider"
        :mode="'project'"
        :caption="true"
        :autoplay="false"
        :controls="true"
      />
    </section>
    <section class="content">
      <FieldText element="h4" :text="label.header" class="header" />
      <TextRowList :table="fields.table" />
      <RelatedContent :related="fields.related_content" />
    </section>
  </main>
</template>

<style lang="scss" scoped>
.template-project {
  overflow-y: auto;
  scroll-snap-type: y mandatory;
}

.title,
.subtitle,
.content {
  @include center-content;
}

.title,
.header {
  @include ff-sans;
}

.title {
  @include fs-xlarge;
}

.header {
  @include fs-medium;
}

.slideshow {
  display: grid;
  grid-template-rows: auto auto minmax(0, 1fr);
  height: calc(
    100% - var(--blank-line)
  ); // account for project infos below the fold

  scroll-snap-align: start;
}

.slider {
  height: 100%;
}

.content {
  min-height: 100%;
  scroll-snap-align: start;
}
</style>
