export const useLayoutStore = defineStore('layout', () => {
  const layout = ref({
    template: '',
    openOverlay: {
      checkout: false,
      checkoutTitle: null as string | null,
      filter: false,
      footnote: false,
      navigation: false,
    },
    currentFootnote: null as number | null,
    currentSubNav: null as number | null,
  })

  return {
    layout,
  }
})

if (import.meta.hot) {
  import.meta.hot.accept(acceptHMRUpdate(useLayoutStore, import.meta.hot))
}
