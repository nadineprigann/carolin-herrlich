<script lang="ts" setup>
interface TemplateLevelA extends Page {
  fields: {
    meta_description: string
    title: string
  }
}

const props = defineProps<{
  data: TemplateLevelA
}>()

const { fields } = toRefs(props.data)
</script>

<template>
  <main class="template-basic-page">
    <FieldText element="h2" :text="fields.title" />
  </main>
</template>

<style lang="scss" scoped>
// .template-basic-page {}
</style>
