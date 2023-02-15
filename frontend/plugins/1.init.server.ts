export default defineNuxtPlugin(async () => {
  await useLanguageStore().init()
  useDefaultsStore().fetch()
})
