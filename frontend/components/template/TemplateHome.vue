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
  <main class="template-home" :style="componentStyle">
    <FieldText element="h3" :text="fields.subtitle" />
    <section class="links">
      <FieldLink
        v-for="(link, index) in fields.custom_links"
        :key="index"
        :link="link"
      />
    </section>
    <SliderMatrix :items="fields.slider" />
  </main>
</template>

<style lang="scss" scoped>
.template-home {
  display: flex;
  flex-direction: column;
  height: 100vh;
  overflow: hidden;
}

.subtitle {
  flex: 1 1 0;
  min-height: 0;
}
</style>
