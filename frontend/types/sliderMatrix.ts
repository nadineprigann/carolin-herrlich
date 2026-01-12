export {}

declare global {
  interface MatrixTypeHomeSlide extends MatrixItem {
    title: string
    date_start?: string
    date_end?: string
    text?: string
    image: Image
    select_category?: PageReference[]
    select_page: PageReference[]
  }

  interface MatrixTypeContentSlide extends MatrixItem {
    image: Image
  }
}
