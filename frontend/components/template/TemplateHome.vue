<script lang="ts" setup>
interface TemplateHome extends Page {
  fields: {
    meta_description: string
    title: string
  }
}

const props = defineProps<{
  data: TemplateHome
}>()

const { fields } = toRefs(props.data)
</script>

<template>
  <main class="template-home">
    <FieldText element="h2" :text="fields.title" />
  </main>
</template>

<style lang="scss" scoped>
// .template-home {}
</style>
