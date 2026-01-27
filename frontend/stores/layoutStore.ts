export const useLayoutStore = defineStore('layout', () => {
  const layout = ref({
    template: '',
    openOverlay: {
      checkout: false,
      blog: false,
      tools: false,
      events: false,
      project: false,
    },
  })

  return {
    layout,
  }
})

if (import.meta.hot) {
  import.meta.hot.accept(acceptHMRUpdate(useLayoutStore, import.meta.hot))
}
