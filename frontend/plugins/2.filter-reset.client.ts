export default defineNuxtPlugin(() => {
  // clear filters in store when leaving werkzeugpalette, blog or veranstaltungen sections to avoid showing wrong filters when navigating to other routes. this is needed because filters are stored in a central store and not in the URL, so they persist across pages until cleared. the contexts are identified by their path segments, so whenever the user leaves one of these sections, the filters are cleared. this ensures that when the user navigates to other sections, they see the default filter state instead of the previously selected filters. but be aware: also resets filters when leaving context and coming back to it
  const router = useRouter()
  const formStore = useFormStore()

  const filterContexts = ['werkzeugpalette', 'blog', 'veranstaltungen']

  const getContext = (path: string) => {
    return filterContexts.find((ctx) => path.includes(ctx))
  }

  router.beforeEach((to, from) => {
    const fromContext = getContext(from.path)
    const toContext = getContext(to.path)

    // clear store when leaving a filter context OR switching context
    if (fromContext && fromContext !== toContext) {
      formStore.clear()
    }
  })
})
