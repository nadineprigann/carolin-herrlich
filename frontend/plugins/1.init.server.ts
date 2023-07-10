export default defineNuxtPlugin(async () => {
  await useLanguageStore().init()

  const defaultsStore = useDefaultsStore()
  defaultsStore.fetch()
})
