<script lang="ts" setup>
interface TemplateHttpStatus extends Page {
  fields: {
    text: string
    title: string
  }
}

const props = defineProps<{
  data: TemplateHttpStatus
}>()

const { fields } = toRefs(props.data)
</script>

<template>
  <main class="template-http-status">
    <FieldText element="h2" :text="fields.title" />
    <FieldTextarea :text="fields.text" />
  </main>
</template>

<style lang="scss" scoped>
// .template-http-status {}
</style>
