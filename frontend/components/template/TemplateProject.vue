<script lang="ts" setup>
interface TemplateProject extends Page {
  fields: ProjectItem
}

const props = defineProps<{
  data: TemplateProject
}>()

const { fields } = toRefs(props.data)
</script>

<template>
  <main class="template-project">
    <section class="intro">
      <FieldText element="h2" :text="fields.title" class="title" />
      <FieldText
        v-if="fields.subtitle"
        element="h3"
        :text="fields.subtitle"
        class="subtitle"
      />
      <ImageSlider
        :slides="fields.images"
        class="slider"
        :mode="'project'"
        :show-caption="false"
        :autoplay="false"
      />
    </section>
    <RowList :table="fields.table" />
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
// .template-project {}

.title,
.subtitle {
  @include center-content;
}

.intro {
  display: grid;
  grid-template-rows: auto minmax(0, 1fr);
  height: calc(
    100% - var(--blank-line)
  ); // account for project infos below the fold
}

.slider {
  height: 100%;
}
</style>
