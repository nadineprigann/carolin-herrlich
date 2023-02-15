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

  interface Page {
    meta: {
      id: number
      name?: string
      template: string
      url: URL
    }
    fields: {
      meta_description?: string
      title: string
    }
  }
}
