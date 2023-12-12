export type Post = {
  id: number
  title: string
  date: string
  contentItems: ContentItem[]
}

type ContentItem = {
  text?: string
  img?: string
  code?: string
}
