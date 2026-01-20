<script lang="ts" setup>
interface TemplateTools extends Page {
  fields: {
    meta_description: string
    // content: MatrixItem[]
  }
}

const props = defineProps<{
  data: TemplateTools
}>()

const { fields } = toRefs(props.data)
</script>

<template>
  <main class="template-tools">
    <FieldText element="h2" :text="fields.title" />
    <!-- <FieldMatrix :items="fields.content" /> -->
  </main>
</template>

<style lang="scss" scoped>
// .template-tools {}
</style>
