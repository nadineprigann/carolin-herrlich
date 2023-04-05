export const useLanguageStore = defineStore('language', () => {
  const runtimeConfig = useRuntimeConfig()
  const route = useRoute()
  const router = useRouter()
  const defaultsStore = useDefaultsStore()
  const { defaults } = storeToRefs(defaultsStore)

  // State
  const isoCode = ref(runtimeConfig.public.language)
  const al = computed(() => runtimeConfig.public.availableLanguages.split(','))
  const availableLanguages = ref(al)

  // Actions
  function init() {
    // Check if URL has language segment
    const langSegment = route.fullPath
      .split('/')
      .filter((segment) => segment)[0]
    // If yes, then update the language
    if (availableLanguages.value.includes(langSegment)) change(langSegment)
  }

  function set(payload: string) {
    isoCode.value = payload
  }

  async function change(payload: string) {
    // Only run code if language actually changes
    if (isoCode.value !== payload) {
      // Set new language
      set(payload)

      // Load defaults in new language
      await defaultsStore.fetch()

      // Redirect to language-specific URL of current page. This in return loads page data in new language.
      const newRoute = defaults.value.navigation.find((r) => {
        return r.meta.id === route.meta.id
      })
      if (newRoute) router.push(newRoute.meta.url)
    }
  }

  return {
    isoCode,
    init,
    set,
    change,
  }
})

if (import.meta.hot) {
  import.meta.hot.accept(acceptHMRUpdate(useLanguageStore, import.meta.hot))
}
