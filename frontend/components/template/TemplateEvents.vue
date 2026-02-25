<script lang="ts" setup>
interface TemplateEvents extends Page {
  children: childItem[]
}

const props = defineProps<{
  data: TemplateEvents
}>()

const { fields, breadcrumbs, categories } = toRefs(props.data)

const label = reactive({
  current: 'Aktuell',
  archive: 'Archiv',
})

const showChildren = computed(() => {
  return props.data.children?.length > 0
})
</script>

<template>
  <main class="template-events">
    <BreadcrumbList :breadcrumbs="breadcrumbs" />
    <FieldText element="h2" :text="fields.title" class="title" />
    <FilterBar :overlay="'filter'" />
    <section class="current-events">
      <FieldText class="random-label" element="h3" :text="label.current" />
      <ChildList v-if="showChildren" :children="props.data.children" />
    </section>
    <!-- TODO: implement archive functionality: checkbox to mark posts as archived, filter here. successively: automatically move posts older than X months to archive -->
    <!-- <section class="archive-events">
      <FieldText class="random-label" element="h3" :text="label.archive" />
      <ChildList :children="" />
    </section> -->
    <FilterOverlay
      :filters="categories"
      :template="'events'"
      :title="fields.title"
    />
  </main>
</template>

<style lang="scss" scoped>
.template-events {
  @include center-content;
}
</style>
