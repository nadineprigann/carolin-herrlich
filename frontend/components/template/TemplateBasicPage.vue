<script lang="ts" setup>
interface TemplateBasicPage extends Page {
  fields: {
    meta_description: string
    text: string
    title: string
  }
}

const props = defineProps<{
  data: TemplateBasicPage
}>()

const { fields } = toRefs(props.data)
</script>

<template>
  <main class="template-basic-page">
    <FieldText element="h2" :text="fields.title" />
    <FieldTextarea :text="fields.text" />
  </main>
</template>

<style lang="scss" scoped>
// .template-basic-page {}
</style>
