<script lang="ts" setup>
interface TemplateProjects extends Page {
  children: childItem[]
}

const props = defineProps<{
  data: TemplateProjects
}>()

const { fields, breadcrumbs } = toRefs(props.data)

const showChildren = computed(() => {
  return props.data.children?.length > 0
})
</script>

<template>
  <main class="template-projects">
    <BreadcrumbList :breadcrumbs="breadcrumbs" />
    <FieldText element="h2" :text="fields.title" class="title" />
    <ProjectList v-if="showChildren" :children="props.data.children" />
  </main>
</template>

<style lang="scss" scoped>
// .template-projects {}

.title {
  @include center-content;
  @include ff-sans;
}
</style>
