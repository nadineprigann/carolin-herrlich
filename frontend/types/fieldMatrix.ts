export {}

declare global {
  interface MatrixItem {
    type: string
  }

  interface MatrixTypeImage extends MatrixItem {
    image: Image
    caption?: string
    grid_space: GridSpace
    depth: number
  }

  interface MatrixTypeImages extends MatrixItem {
    images: Image[]
  }

  interface MatrixTypeOembed extends MatrixItem {
    oembed: Oembed
    caption?: string
    grid_space: GridSpace
    depth: number
  }

  interface MatrixTypeSection extends MatrixItem {
    title: string
    name: string
  }

  interface MatrixTypeSlider extends MatrixItem {
    slider: Slide[]
  }

  interface MatrixTypeText extends MatrixItem {
    text: string
    depth: number
  }
}
