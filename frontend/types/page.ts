export {}

declare global {
  interface ImageUrl {
    url: string
    width?: number
  }

  interface Image {
    description: string
    ratio: number
    resized: boolean
    urls: ImageUrl[]
  }

  interface Alternate {
    url: string
    lang: string
  }

  interface Meta {
    alternate: Alternate[]
    id: number
    name?: string
    template: string
    url: URL
  }

  interface Page {
    meta: Meta
    fields: {
      meta_description?: string
      title: string
    }
  }

  interface PageReference {
    meta: Meta
    fields: {
      title: string
    }
  }
}
