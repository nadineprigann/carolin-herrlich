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
const TemplateBlog = resolveComponent('TemplateBlog')
const TemplateBlogPost = resolveComponent('TemplateBlogPost')
const TemplateEvents = resolveComponent('TemplateEvents')
const TemplateEvent = resolveComponent('TemplateEvent')
const TemplateOffer = resolveComponent('TemplateOffer')
const TemplateSummary = resolveComponent('TemplateSummary')
const TemplateProjects = resolveComponent('TemplateProjects')
const TemplateProject = resolveComponent('TemplateProject')
const TemplateChapter = resolveComponent('TemplateChapter')
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
  if (meta.template === 'blog') return TemplateBlog
  if (meta.template === 'blog-post') return TemplateBlogPost
  if (meta.template === 'events') return TemplateEvents
  if (meta.template === 'event') return TemplateEvent
  if (meta.template === 'offer') return TemplateOffer
  if (meta.template === 'summary') return TemplateSummary
  if (meta.template === 'projects') return TemplateProjects
  if (meta.template === 'project') return TemplateProject
  if (meta.template === 'chapter') return TemplateChapter

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

// SEO-Optimization:
// for SEO: in case the site name and the name of the owner are not equal, use his / her name as page title on home to improve connection of both (when searching for "name", site is more likely to be found)
const pageTitle = computed(() => {
  if (meta.template === 'home') return 'Carolin Herrlich'
  return fields.title
})

// for SEO: if there is a page title, use "page title · site name", otherwise just site name (e.g. on error pages) -> essentially just the older version outsourced and hardcoed home title added
const fullTitle = computed(() => {
  if (!pageTitle.value) return defaults.value.appTitle
  if (!defaults.value.appTitle) return pageTitle.value

  return `${pageTitle.value} · ${defaults.value.appTitle}`
})

useHead({
  htmlAttrs: {
    lang: isoCode,
  },
  link: alternate,
})

// https://nuxt.com/docs/4.x/api/composables/use-seo-meta
useSeoMeta({
  title: () => fullTitle.value, // let template apply formatting
  description: () => fields.meta_description, //  () => computed getter to make it reactive, otherwise it would not update on language change
  ogTitle: () => fullTitle.value,
  ogDescription: () => fields.meta_description,
  ogType: 'website',
  ogImage: `${runtimeConfig.public.baseUrl}/sharing-image.jpg`, // always placed in /public
  twitterCard: 'summary_large_image',
})
</script>

<template>
  <div>
    <NuxtLayout :name="nuxtLayout">
      <component :is="template" :data="data" />
    </NuxtLayout>
  </div>
</template>
