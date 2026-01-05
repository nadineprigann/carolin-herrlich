export const useApi = () => {
  const runtimeConfig = useRuntimeConfig()
  const route = useRoute()
  const languageStore = useLanguageStore()
  const { isoCode } = storeToRefs(languageStore)

  // https://nuxt.com/docs/api/composables/use-fetch
  const get = (endpoint: string) =>
    useFetch(runtimeConfig.public.apiBase + '/' + endpoint, {
      // onRequest({ request, options }) {
      onRequest({ options }) {
        options.headers = {
          'x-api-key': runtimeConfig.public.apiSecret,
          'x-api-language': isoCode.value,
        }
      },
      // onRequestError({ request, options, error }) {
      //   // Handle the request errors
      //   console.log(error);
      // },
      // onResponseError({ request, response, options }) {
      //   // Handle the response errors
      //   console.log(error);
      // },
    })

  const getPage = (path?: string) => {
    // If no path is provided, fall back to current route path
    const p = path || route.path
    return get('page' + p)
  }

  return {
    get,
    getPage,
  }
}
