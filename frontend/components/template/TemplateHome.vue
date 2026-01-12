<script lang="ts" setup>
interface TemplateHome extends Page {
  fields: {
    title: string
    subtitle: string
    custom_links: LinkItem[]
    slider: MatrixTypeHomeSlide[]
    meta_description: string
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
    <FieldText element="h3" :text="fields.subtitle" />
    <FieldLink
      v-for="(link, index) in fields.custom_links"
      :key="index"
      :link="link"
    />
    <SliderMatrix :items="fields.slider" />
  </main>
</template>

<style lang="scss" scoped>
// .template-home {}
</style>
