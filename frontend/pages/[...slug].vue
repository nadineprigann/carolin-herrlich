<script lang="ts" setup>
// Get page data from API
const { data } = await useApi().getPage()
const { meta, fields } = data.value as Page

// Pick component based on backend template
// TODO: Ideally, this would be possible by just passing the component name as a string
// see https://nuxt.com/docs/guide/directory-structure/components/#dynamic-components
const TemplateCatchAll = resolveComponent('TemplateCatchAll')
const TemplateHttpStatus = resolveComponent('TemplateHttpStatus')
const TemplateBasicPage = resolveComponent('TemplateBasicPage')
const TemplateHome = resolveComponent('TemplateHome')
const TemplateLevelA = resolveComponent('TemplateLevelA')
const TemplateOverview = resolveComponent('TemplateOverview')
const TemplateTools = resolveComponent('TemplateTools')
const TemplateTool = resolveComponent('TemplateTool')
// Register new templates here...

const template = computed(() => {
  if (meta.template === 'http-status') return TemplateHttpStatus
  if (meta.template === 'basic-page') return TemplateBasicPage
  if (meta.template === 'home') return TemplateHome
  if (meta.template === 'level-a') return TemplateLevelA
  if (meta.template === 'overview') return TemplateOverview
  if (meta.template === 'overview-tools') return TemplateOverview
  if (meta.template === 'tools') return TemplateTools
  if (meta.template === 'tool') return TemplateTool
  // ... and match them here

  // If no matching component was found, fall back to "catch all" component
  return TemplateCatchAll
})

// Set route meta (currently needed during useLanguageStores().change())
const route = useRoute()
route.meta.id = meta.id
route.meta.template = meta.template

// Set template in layout store
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)
layout.value.template = meta.template

// Set layout
const nuxtLayout = computed(() => {
  return 'default'
})

// Set HTML head data
const defaultsStore = useDefaultsStore()
const { defaults } = storeToRefs(defaultsStore)
const languageStore = useLanguageStore()
const { isoCode } = storeToRefs(languageStore)

const runtimeConfig = useRuntimeConfig()
const alternate = computed(() => {
  return meta.alternate.map((item) => {
    return {
      rel: 'alternate',
      href: runtimeConfig.public.baseUrl + item.url,
      hreflang: item.lang,
    }
  })
})

useHead({
  htmlAttrs: {
    lang: isoCode,
  },
  link: alternate,
})

useSeoMeta({
  titleTemplate: (titleChunk) => {
    // If appTitle is undefined, just return titleChunk
    if (!defaults.value.appTitle) return `${titleChunk}`

    return titleChunk === defaults.value.appTitle
      ? defaults.value.appTitle
      : `${titleChunk} - ${defaults.value.appTitle}`
  },
  title: () => fields.title,
  description: () => fields.meta_description,
})
</script>

<template>
  <div>
    <NuxtLayout :name="nuxtLayout">
      <component :is="template" :data="data" />
    </NuxtLayout>
  </div>
</template>
