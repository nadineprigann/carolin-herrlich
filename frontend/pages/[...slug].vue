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
// Register new templates here...

const template = computed(() => {
  if (meta.template === 'http-status') return TemplateHttpStatus
  if (meta.template === 'basic-page') return TemplateBasicPage
  if (meta.template === 'home') return TemplateHome
  // ... and match them here

  // If no matching component was found, fall back to "catch all" component
  return TemplateCatchAll
})

// Set route meta (currently needed during useLanguageStores().change())
const route = useRoute()
route.meta.id = meta.id

// Set HTML head data
const languageStore = useLanguageStore()
const { isoCode } = storeToRefs(languageStore)
useHead({
  htmlAttrs: {
    lang: isoCode,
  },
})

const defaultsStore = useDefaultsStore()
const { defaults } = storeToRefs(defaultsStore)
useSeoMeta({
  titleTemplate: (titleChunk) => {
    return titleChunk === defaults.value.appTitle
      ? defaults.value.appTitle
      : `${titleChunk} - ${defaults.value.appTitle}`
  },
  title: () => fields.title,
  description: () => fields.meta_description,
})
</script>

<template>
  <component :is="template" :data="data" />
</template>
