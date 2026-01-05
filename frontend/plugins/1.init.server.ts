export default defineNuxtPlugin(() => {
  useLanguageStore().init()

  const defaultsStore = useDefaultsStore()
  defaultsStore.fetch()
})
