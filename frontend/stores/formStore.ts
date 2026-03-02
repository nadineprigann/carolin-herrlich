export const useFormStore = defineStore('form', () => {
  // first, create types for selected filters...
  type Selected = {
    alphabetical: string | null
    categories: Category[]
    chronological: string | null
    cyclical: string[]
  }

  const initial: Selected = {
    alphabetical: null,
    categories: [],
    chronological: null,
    cyclical: [],
  }

  let selected = reactive<Selected>({
    // checkout overlay fields
    // firstName: '',
    // lastName: '',
    // pronouns: '',
    // mail: '',
    // message: '',

    // filter overlay fields
    alphabetical: null, // single-select radio button
    categories: [], // buttons
    chronological: null, // single-select radio button
    cyclical: [], // buttons
  })

  // get all selected filter titles in a flat array, in the order of the filter sections
  const flattenSelectedToTitles = (selected: Selected): string[] => {
    const titles = [
      selected.alphabetical,
      selected.chronological,
      ...selected.cyclical,
      ...selected.categories.map((category) => category.title),
    ]

      // remove empties + dedupe, keep order
      .map((t) => (t ?? '').toString().trim()) // convert nulls to empty strings, trim whitespace
      .filter(Boolean)

    // dedupe, keep order
    return [...new Set(titles)] // filter out empty strings
  }

  // then, create a computed property that flattens the selected filters to an array of titles whenever selected changes
  const selectedTitles = computed(() => flattenSelectedToTitles(selected))

  const clear = () => {
    Object.assign(selected, JSON.parse(JSON.stringify(initial))) // reset selected filters to initial values by creating a deep copy of the initial object
  }

  // function setSelectedField<T>(key: string, value: T) {
  //   selected[key] = value
  // }

  return { selected, initial, clear, selectedTitles }
})
