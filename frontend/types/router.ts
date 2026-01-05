// https://router.vuejs.org/guide/advanced/meta.html#typescript
import 'vue-router'
declare module 'vue-router' {
  interface RouteMeta {
    id: number
    template: string
    title: string
    url: string
  }
}

declare global {
  interface Route {
    name: string
    meta: {
      id: number
      template: string
      title: string
      url: string
    }
    path: string
  }
}
