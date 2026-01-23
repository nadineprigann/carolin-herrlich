<script lang="ts" setup>
interface TemplateEvent extends Page {
  fields: childItem
  external_link: string
  external_link_title: string
}

const props = defineProps<{
  data: TemplateEvent
}>()

const { fields } = toRefs(props.data)
</script>

<template>
  <main class="template-event">
    <FieldText element="h2" :text="fields.title" />
    <FieldText v-if="fields.subtitle" element="h2" :text="fields.subtitle" />
    <FieldMatrix :items="fields.content" />
    <CustomButton
      v-if="fields.external_link"
      :url="fields.external_link"
      :label="fields.external_link_title"
    />
    <RelatedContent :related="fields.related_content" />
  </main>
</template>

<style lang="scss" scoped>
// .template-event {}
</style>
