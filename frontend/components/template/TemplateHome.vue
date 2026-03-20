<script lang="ts" setup>
const config = useRuntimeConfig()
const defaultsStore = useDefaultsStore()
const { defaults } = storeToRefs(defaultsStore)
const languageStore = useLanguageStore()
const { isoCode } = storeToRefs(languageStore)

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

// set structured data for SEO. important for home page in particular, as it is the most likely to be shared and linked to, as well as for when owner and site name are not the same
useHead({
  script: [
    {
      type: 'application/ld+json',
      children: JSON.stringify({
        '@context': 'https://schema.org',
        '@graph': [
          {
            '@type': 'WebSite',
            '@id': `${config.public.baseUrl}/#website`,
            url: config.public.baseUrl,
            name: defaults.value.appTitle,
            description: fields.value.subtitle,
            inLanguage: isoCode.value,
            publisher: {
              '@id': `${config.public.baseUrl}/#person`,
            },
            creator: {
              '@id': 'https://nadineprigann.de/#organization',
            },
          },
          {
            '@type': 'Person',
            '@id': `${config.public.baseUrl}/#person`,
            name: 'Carolin Herrlich',
            url: config.public.baseUrl,
            worksFor: {
              '@id': `${config.public.baseUrl}/#website`,
            },
            sameAs: [
              // optional: add social profiles if they exist
              // 'https://instagram.com/...',
              // 'https://linkedin.com/in/...'
            ],
          },
          {
            '@type': 'Organization',
            '@id': 'https://nadineprigann.de/#organization',
            name: 'Nadine Prigann – Nachhaltiges Webdesign und Webentwicklung',
            url: 'https://nadineprigann.de',
          },
        ],
      }),
    },
  ],
})

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
  gap: calc(var(--gutter-base) * 4);
  height: calc(
    100vh - var(--header-height)
  ); // full viewport height minus header, set via default.vue and AppHeader.vue communication

  min-height: 0; // this makes sure the content can shrink if needed, preventing overflow when there are no slides
  padding: var(--page-spacing);
  padding-top: var(--gutter-l);
  padding-bottom: var(--gutter-l);
  overflow: hidden;
}

.content {
  @media (min-width: $xsmall) {
    max-width: 70vw;
    margin: 0 auto;
  }

  @media (min-width: $tablet) {
    max-width: 25em;
  }

  @media (min-width: $desktop) {
    max-width: 25em;
  }
}

.subtitle {
  @include ff-sans;
  @include fs-large;

  text-align: center;
}

.slider {
  position: relative; // for links positioning

  @media (min-width: $tablet) {
    @include center-content;
  }
}

.links {
  position: absolute;
  top: calc(var(--gutter-base) * -1);
  z-index: var(--m-upper-content); // above slider
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}
</style>
