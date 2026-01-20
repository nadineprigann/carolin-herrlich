export {}

declare global {
  interface MatrixItem {
    type: string
  }

  interface MatrixTypeText extends MatrixItem {
    text: string
  }

  interface MatrixTypeImages extends MatrixItem {
    images: Image[]
  }

  interface MatrixTypeSlider extends MatrixItem {
    images: Image[]
  }

  interface MatrixTypeAccordion extends MatrixItem {
    title: string
    subtitle?: string
    accordion: MatrixItem[]
  }

  interface MatrixTypeTable extends MatrixItem {
    title: string
    table: RowItem[]
  }
}
