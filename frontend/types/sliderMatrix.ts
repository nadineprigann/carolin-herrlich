export {}

declare global {
  interface MatrixTypeHomeSlide extends MatrixItem {
    title: string
    date_start?: string
    date_end?: string
    text?: string
    image: Image
    categories?: PageReference[]
    link: PageReference
  }
}
