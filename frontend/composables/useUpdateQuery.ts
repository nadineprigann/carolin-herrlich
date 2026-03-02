export function useUpdateQuery() {
  const router = useRouter()
  const route = useRoute()
  const formStore = useFormStore()

  // use async / await syntax to ensure that the query is updated before any subsequent actions are taken (e.g. closing overlay, ...)
  const setQuery = async () => {
    const filters = formStore.selectedTitles
    const query = { ...route.query }
    if (filters.length) query.filter = filters
    else delete query.filter

    await router.replace({
      query,
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
        listFilters: {},
      },
    })
  }

  return { setQuery, resetQuery }
}
