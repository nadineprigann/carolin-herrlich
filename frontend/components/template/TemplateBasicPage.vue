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
  <div class="template-basic-page">
    <!-- eslint-disable-next-line vue/no-v-html -->
    <h2 v-html="fields.title" />
    <BaseTextarea :text="fields.text" />
  </div>
</template>

<style lang="scss" scoped>
// .template-basic-page {}
</style>
