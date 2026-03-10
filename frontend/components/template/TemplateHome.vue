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

const hasLinks = computed(() => {
  return fields.value.custom_links && fields.value.custom_links.length > 0
})
</script>

<template>
  <main class="template-home">
    <section class="content">
      <FieldText element="h3" :text="fields.subtitle" class="subtitle" />
    </section>
    <section class="slider">
      <div v-if="hasLinks" class="links">
        <FieldLink
          v-for="(link, index) in fields.custom_links"
          :key="index"
          :link="link"
          class="link"
        />
      </div>
      <SliderMatrix :items="fields.slider" />
    </section>
  </main>
</template>

<style lang="scss" scoped>
.template-home {
  display: grid;
  grid-template-rows: auto minmax(0, 1fr); /* text, then slider */
  gap: var(--gutter-xl);
  gap: calc(var(--gutter-base) * 6);
  min-height: 0; // this makes sure the content can shrink if needed, preventing overflow when there are no slides
  padding: var(--page-spacing);
  padding-top: var(--gutter-l);
  padding-bottom: var(--gutter-s);
  overflow: hidden;

  @media (min-width: $medium) {
    gap: var(--gutter-l);
    padding: 0 calc(var(--gutter-base) * 20) var(--gutter-m)
      calc(var(--gutter-base) * 20);
  }
}

.subtitle {
  @include ff-sans;
  @include fs-large;

  text-align: center;

  @media (min-width: $xsmall) {
    max-width: 70vw;
    margin: 0 auto;
  }

  @media (min-width: $tablet) {
    max-width: 55vw;
  }

  @media (min-width: $desktop) {
    max-width: 40vw;
  }
}

.slider {
  position: relative; // for links positioning
}

.links {
  position: absolute;
  top: calc(var(--gutter-base) * -1);
  z-index: var(--m-upper-content); // above slider
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}

.link {
  @include highlight-element($radius: 1em);
  @include button-padding(
    $top: var(--spacing-xxs),
    $right: var(--spacing-s),
    $bottom: 0.35em,
    $left: var(--spacing-s)
  );

  &:not(:last-child) {
    margin-bottom: var(--gutter-base);
  }

  @media (min-width: $tablet) {
    &:not(:last-child) {
      margin-bottom: var(--gutter-s);
    }
  }
}
</style>
