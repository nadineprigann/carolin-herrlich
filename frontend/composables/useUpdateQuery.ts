export function useUpdateQuery() {
  const router = useRouter()
  const route = useRoute()
  const formStore = useFormStore()
  const { selectedTitles } = storeToRefs(formStore)

  // use async / await syntax to ensure that the query is updated before any subsequent actions are taken (e.g. closing overlay, ...)
  const setQuery = async (options?: { path?: string }) => {
    // if filters or path are provided as options, use them, otherwise fall back to current selected filters and route path. this allows for using the function within FilterOverlay where path and filters come from the store and using it in OverviewItem where filters are passed as options and path is derived from route.
    const filters = selectedTitles.value
    const path = options?.path ?? route.path

    const query = { ...route.query }
    if (filters.length) query.filter = filters
    else delete query.filter

    await router.replace({
      path,
      // set query
      query,
      // ... and also update nav state with the updated filters to ensure that BreadcrumbItem and ChildItem are updated accordingly. merge with existing state to avoid overwriting any other state properties that might be set by other parts of the app.
      state: {
        ...(window.history.state ?? {}),
        listFilters: { filter: filters },
      },
    })
  }

  const resetQuery = async () => {
    const query = { ...route.query }
    if (query.filter) delete query.filter
    // wait until URL change is done before continuing with any subsequent actions (e.g. closing overlay, ...). reset filters AND nav state to ensure that BreadcrumbItem and ChildItem are updated accordingly
    await router.replace({
      query,
      state: {
        ...(window.history.state ?? {}),
        listFilters: { filter: [] },
      },
    })
  }

  return { setQuery, resetQuery }
}
