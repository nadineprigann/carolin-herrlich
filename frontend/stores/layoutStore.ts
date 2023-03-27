export const useLayoutStore = defineStore('layout', () => {
  const layout = ref({
    template: '',
  })

  return {
    layout,
  }
})

if (import.meta.hot) {
  import.meta.hot.accept(acceptHMRUpdate(useLayoutStore, import.meta.hot))
}
