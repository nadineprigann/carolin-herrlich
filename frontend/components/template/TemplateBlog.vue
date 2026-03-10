<script lang="ts" setup>
interface TemplateBlog extends Page {
  children: childItem[]
}

const props = defineProps<{
  data: TemplateBlog
}>()

const { fields, breadcrumbs, categories } = toRefs(props.data)

const label = reactive({
  current: 'Aktuell',
  archive: 'Archiv',
  loadArchive: 'Archiv laden',
})

const showChildren = computed(() => {
  return props.data.children?.length > 0
})
</script>

<template>
  <main class="template-blog">
    <BreadcrumbList :breadcrumbs="breadcrumbs" />
    <FieldText element="h2" :text="fields.title" class="title" />
    <!-- <FilterBar :overlay="'filter'" /> -->
    <section class="current">
      <FieldText class="label" element="h3" :text="label.current" />
      <ChildList v-if="showChildren" :children="props.data.children" />
    </section>
    <!-- TODO: implement archive functionality: checkbox to mark posts as archived, filter here. successively: automatically move posts older than X months to archive -->
    <!-- <button type="button" v-text="label.loadArchive" /> -->
    <!-- <section class="archive-posts">
      <FieldText class="label" element="h3" :text="label.archive" />
      <ChildList :children="" />
    </section> -->
    <FilterOverlay
      :filters="categories"
      :template="'blog'"
      :title="fields.title"
    />
  </main>
</template>

<style lang="scss" scoped>
.template-blog {
  @include center-content;

  padding: var(--page-spacing);
}

.title,
.label {
  @include ff-sans;
}

.title {
  @include fs-xlarge;

  margin-bottom: var(--gutter-xl);

  @media (min-width: $medium) {
    margin-bottom: calc(var(--gutter-base) * 5);
  }
}

.label {
  @include fs-medium;

  padding-bottom: var(--accordion-title-spacing);
  border-bottom: 1px solid var(--black);
}

.current {
  // note: remove the following delcaration when archive is implemented

  padding-bottom: var(--page-end);
}

// .archive {
//   padding-bottom: var(--page-end);
//   margin-top: calc(var(--gutter-base) * 5);

//   @media (min-width: $tablet) {
//     margin-top: calc(var(--gutter-base) * 10);
//   }
// }
</style>
