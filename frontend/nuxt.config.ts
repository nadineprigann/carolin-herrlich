// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  runtimeConfig: {
    public: {
      baseUrl: '',
      apiBase: '',
      // TODO: Make apiSecret private (currently needed on every request)
      apiSecret: '',
      availableLanguages: '',
      language: '',
    },
  },

  app: {
    pageTransition: { name: 'page', mode: 'out-in' },

    // head: {
    //   // Place icon files in /public directory
    //   link: [
    //     {
    //       // Size: 32x32px
    //       rel: 'icon',
    //       href: '/favicon.ico',
    //       sizes: 'any',
    //     },
    //     {
    //       rel: 'icon',
    //       href: '/favicon.svg',
    //       type: 'image/svg+xml',
    //     },
    //     {
    //       // Size: 180x180px
    //       rel: 'apple-touch-icon',
    //       href: '/apple-touch-icon.png',
    //     },
    //   ],
    // },
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
