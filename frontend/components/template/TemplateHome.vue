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
    <section class="content">
      <FieldText element="h3" :text="fields.subtitle" class="subtitle" />
      <div class="links">
        <FieldLink
          v-for="(link, index) in fields.custom_links"
          :key="index"
          :link="link"
        />
      </div>
    </section>
    <SliderMatrix :items="fields.slider" />
  </main>
</template>

<style lang="scss" scoped>
.template-home {
  position: relative; // for links positioning
  display: grid;
  grid-template-rows: auto minmax(0, 1fr); /* text, then slider */
  min-height: 0; // this makes sure the content can shrink if needed, preventing overflow when there are no slides
  overflow: hidden;
}

.subtitle {
  @include ff-sans;

  text-align: center;
}

.links {
  position: absolute;
  top: 10%;
  z-index: var(--m-upper-content); // above slider
}
</style>
