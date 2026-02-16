export const useBreakpointsStore = defineStore('breakpoints', () => {
  const breakpoints = ref({
    // these have to match with breakpoints defined in _breakpoints.scss
    small: null as MediaQueryList | null,
    medium: null as MediaQueryList | null,
    large: null as MediaQueryList | null,
  })

  const isSmall = ref(false)
  const isDesktop = ref(false)
  const isLarge = ref(false)

  function update() {
    // if not initialized yet (SSR or before onMounted), keep defaults
    if (!breakpoints.value.small) return

    isSmall.value = breakpoints.value.small!.matches
    isDesktop.value = breakpoints.value.medium!.matches
    isLarge.value = breakpoints.value.large!.matches
  }

  function init() {
    if (typeof window === 'undefined') return

    breakpoints.value.small = window.matchMedia('(min-width: 40em)')
    breakpoints.value.medium = window.matchMedia('(min-width: 48em)')
    breakpoints.value.large = window.matchMedia('(min-width: 64em)')

    update()

    const onChange = () => update()

    Object.values(breakpoints.value).forEach((mq) => {
      if (!mq) return
      // modern
      if ('addEventListener' in mq) mq.addEventListener('change', onChange)
      // fallback (older Safari)
      // @ts-expect-error legacy
      else mq.addListener(onChange)
    })
  }

  return {
    breakpoints,
    isSmall,
    isDesktop,
    isLarge,
    init,
    update,
  }
})

if (import.meta.hot) {
  import.meta.hot.accept(acceptHMRUpdate(useBreakpointsStore, import.meta.hot))
}
