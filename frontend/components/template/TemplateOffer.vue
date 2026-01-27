<script lang="ts" setup>
interface TemplateOffer extends Page {
  fields: {
    meta_description: string
    content: MatrixItem[]
  }
}

const props = defineProps<{
  data: TemplateOffer
}>()

const { fields } = toRefs(props.data)
</script>

<template>
  <main class="template-offer">
    <FieldText element="h2" :text="fields.title" />
    <FieldMatrix :items="fields.content" />
  </main>
</template>

<style lang="scss" scoped>
// .template-offer {}
</style>
