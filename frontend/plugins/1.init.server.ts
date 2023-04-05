export default defineNuxtPlugin(async () => {
  await useLanguageStore().init()

  const defaultsStore = useDefaultsStore()
  defaultsStore.fetch()

  // Set hostname (e.g. for useHead)
  useAppConfig().host = useRequestHeaders().host || ''
})
