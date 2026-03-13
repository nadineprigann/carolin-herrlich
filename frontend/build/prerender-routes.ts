type NavItem = {
  path?: string
  children?: NavItem[]
}

function extractPaths(items: NavItem[]): string[] {
  return items.flatMap((item) => [
    ...(item.path && !item.path.includes(':') ? [item.path] : []),
    ...(item.children ? extractPaths(item.children) : []),
  ])
}

export async function getPrerenderRoutes() {
  const apiBase = process.env.NUXT_PUBLIC_API_BASE
  const apiSecret = process.env.NUXT_PUBLIC_API_SECRET
  const language = process.env.NUXT_PUBLIC_LANGUAGE || 'de'

  if (!apiBase || !apiSecret) {
    return []
  }

  const response = await fetch(`${apiBase}/defaults`, {
    headers: {
      'x-api-key': apiSecret,
      'x-api-language': language,
    },
  })

  const data = await response.json()

  return extractPaths(data.navigation || [])
}
