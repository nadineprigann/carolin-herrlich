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

  modules: ['@pinia/nuxt', '@formkit/nuxt'],

  imports: {
    dirs: ['types'],
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

  formkit: {
    // Experimental support for auto loading (see note): https://formkit.com/getting-started/installation
    autoImport: true,
  },

  hooks: {
    // nitro:config hook — runs once at build time, before Nitro starts prerendering
    // Fetches /defaults from your live API (using the same env vars the rest of the build uses)
    // Recursively walks the navigation tree, collects all static paths, skips any with : (dynamic params like :tool, :blog-post)
    // Pushes those paths directly into nitro.prerender.routes — Nitro then renders them unconditionally, regardless of what the crawler finds in HTML
    async 'nitro:config'(nitroConfig) {
      if (nitroConfig.dev) return

      const apiBase = process.env.NUXT_PUBLIC_API_BASE
      const apiSecret = process.env.NUXT_PUBLIC_API_SECRET
      const language = process.env.NUXT_PUBLIC_LANGUAGE || 'de'

      if (!apiBase || !apiSecret) return

      try {
        const response = await fetch(`${apiBase}/defaults`, {
          headers: {
            'x-api-key': apiSecret,
            'x-api-language': language,
          },
        })
        const data = await response.json()

        const extractPaths = (
          items: Array<{ path: string; children?: any[] }>,
        ): string[] =>
          items.flatMap((item) => [
            ...(item.path && !item.path.includes(':') ? [item.path] : []),
            ...(item.children ? extractPaths(item.children) : []),
          ])

        const routes = extractPaths(data.navigation || [])
        nitroConfig.prerender ??= {}
        nitroConfig.prerender.routes = [
          ...((nitroConfig.prerender.routes as string[]) || []),
          ...routes,
        ]
        console.log(
          `[prerender] Added ${routes.length} routes from API navigation`,
        )
      } catch (e) {
        console.warn('[prerender] Failed to fetch routes from API:', e)
      }
    },
  },

  compatibilityDate: '2024-12-25',
})
