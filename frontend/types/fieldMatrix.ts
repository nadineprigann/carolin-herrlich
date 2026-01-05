export {}

declare global {
  interface MatrixItem {
    type: string
  }

  interface MatrixTypeImages extends MatrixItem {
    images: Image[]
  }

  interface MatrixTypeSection extends MatrixItem {
    title: string
    name: string
  }

  interface MatrixTypeText extends MatrixItem {
    text: string
  }
}
