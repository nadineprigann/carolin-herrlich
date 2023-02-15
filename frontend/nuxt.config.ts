// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  runtimeConfig: {
    language: '',
    availableLanguages: '',

    public: {
      apiBase: '',
      // TODO: Make apiSecret private (currently needed on every request)
      apiSecret: '',
    },
  },

  app: {
    pageTransition: { name: 'page', mode: 'out-in' },
  },

  modules: ['@pinia/nuxt'],

  imports: {
    dirs: ['stores', 'types'],
  },

  pinia: {
    autoImports: ['defineStore', 'storeToRefs', 'acceptHMRUpdate'],
  },

  typescript: {
    shim: false,
  },

  vite: {
    css: {
      preprocessorOptions: {
        scss: {
          additionalData: '@use "@/assets/styles/globals.scss" as *;',
        },
      },
    },
  },
})
