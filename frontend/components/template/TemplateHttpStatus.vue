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
    <!-- eslint-disable-next-line vue/no-v-html -->
    <h2 v-html="fields.title" />
    <BaseTextarea :text="fields.text" />
  </main>
</template>

<style lang="scss" scoped>
// .template-http-status {}
</style>
