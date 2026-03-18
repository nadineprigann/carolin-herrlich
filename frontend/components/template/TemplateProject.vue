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

const content = ref(null)

const scrollTo = () => {
  content.value?.scrollIntoView({ behavior: 'smooth' })
}
</script>

<template>
  <main class="template-project" tabindex="-1">
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
    <section id="content" ref="content" class="content">
      <button type="button" class="button" @click="scrollTo">
        <FieldText element="h4" :text="label.header" class="header" />
      </button>
      <TextRowList :table="fields.table" class="table" />
      <RelatedContent :related="fields.related_content" />
    </section>
  </main>
</template>

<style lang="scss" scoped>
.template-project {
  padding: var(--page-spacing);
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

  margin-bottom: var(--gutter-xl);

  @media (min-width: $tablet) {
    margin-bottom: calc(var(--gutter-base) * 5);
  }
}

.header {
  @include fs-medium;

  margin-bottom: var(--gutter-xl);
  cursor: pointer;

  // &::after {
  //   content: '';
  // }
}

.slideshow {
  display: grid;
  grid-template-rows: auto auto minmax(0, 1fr);
  height: calc(
    100% - calc(var(--blank-line) * 2.5)
  ); // account for project infos below the fold

  scroll-snap-align: start;
}

.slider {
  height: 100%;
}

.content {
  min-height: 100%;
  margin-top: var(--blank-line);
  scroll-snap-align: start;
}

.table {
  padding-bottom: var(--page-end);
}

.button {
  @include text-hover;
  @include text-focus;
}
</style>
