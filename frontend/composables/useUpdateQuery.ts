export function useUpdateQuery() {
  const router = useRouter()
  const route = useRoute()
  const formStore = useFormStore()
  const { selectedTitles } = storeToRefs(formStore)

  // use async / await syntax to ensure that the query is updated before any subsequent actions are taken (e.g. closing overlay, ...)
  const setQuery = async () => {
    const filters = selectedTitles.value // somehow the helper var is needed although its destructured above, otherwise query is not updated. suggestions are that selectedTitles in store is not updated yet when accessed here. therefor another var as middleman helps.
    const query = { ...route.query }
    if (filters.length) query.filter = filters
    else delete query.filter

    await router.replace({
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
