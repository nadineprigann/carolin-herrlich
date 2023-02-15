export const useDefaultsStore = defineStore('defaults', () => {
  interface Defaults {
    availableLanguages: string[]
    appTitle: string
    navigation: Route[]
  }

  // State
  const defaults = ref<Defaults>({
    availableLanguages: [],
    appTitle: '',
    navigation: [],
  })

  // Actions
  async function fetch() {
    const { data } = await useApi().get('defaults')
    const fetchedData = data.value as Defaults

    // TODO: Is there a more elegant way to set the values?
    defaults.value.availableLanguages = fetchedData.availableLanguages
    defaults.value.appTitle = fetchedData.appTitle
    defaults.value.navigation = fetchedData.navigation
  }

  return {
    defaults,
    fetch,
  }
})

if (import.meta.hot) {
  import.meta.hot.accept(acceptHMRUpdate(useDefaultsStore, import.meta.hot))
}
