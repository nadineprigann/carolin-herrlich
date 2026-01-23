export {}

declare global {
  interface Datetime {
    formatted: {
      date: string
      time: string
    }
    iso: string
  }

  interface File {
    description?: string
    ext: string
    url: string
  }

  interface ImageUrl {
    url: string
    width?: number
  }

  interface Image {
    alt_text: string
    long_description?: string
    caption: string
    copyright: string
    select_license: PageReference
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
    url: string
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

  interface SelectOption {
    id: number
    title: string
    value?: string
  }

  interface OverviewItem extends PageReference {
    fields: {
      image: Image
    }
  }

  interface RelatedContent {
    [
      {
        context: string
        in_depth: [
          {
            item: PageReference
          },
        ]
      },
    ]
  }

  interface RowItem {
    key: string
    value: string
  }

  interface childItem {
    subtitle: string
    select_category: PageReference[]
    content?: MatrixItem[]
    related_content?: RelatedContent
  }

  interface ProjectItem extends Page {
    fields: {
      image: Image
      images: Image[]
      table: RowItem[]
      related_content?: RelatedConten
    }
  }
}
