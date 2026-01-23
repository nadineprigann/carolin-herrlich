<script lang="ts" setup>
interface TemplateOffers extends Page {
  fields: {
    meta_description: string
    content: MatrixItem[]
  }
}

const props = defineProps<{
  data: TemplateOffers
}>()

const { fields } = toRefs(props.data)
</script>

<template>
  <main class="template-offers">
    <FieldText element="h2" :text="fields.title" />
    <FieldMatrix :items="fields.content" />
  </main>
</template>

<style lang="scss" scoped>
// .template-offers {}
</style>
