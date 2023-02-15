// Use this mixin to delegate links inside rich text fields to Vue Router if they pass all conditions.
// Based on https://dennisreimann.de/articles/delegating-html-links-to-vue-router.html

export const delegateLinks = ($event: MouseEvent) => {
  const router = useRouter()
  const target = $event.target as HTMLAnchorElement

  // Handle only links that occur inside the component and do not reference external resources
  if (target && target.matches("a:not([href*='://'])") && target.href) {
    // Some sanity checks taken from vue-router:
    // https://github.com/vuejs/vue-router/blob/dev/src/components/link.js#L106
    const { altKey, ctrlKey, metaKey, shiftKey, button, defaultPrevented } =
      $event
    // Don't handle with control keys
    if (metaKey || altKey || ctrlKey || shiftKey) return
    // Don't handle when preventDefault called
    if (defaultPrevented) return
    // Don't handle right clicks
    if (button !== undefined && button !== 0) return
    // Don’t handle mailto/tel protocols
    if (target && (target.protocol === 'mailto:' || target.protocol === 'tel:'))
      return
    // Don't handle if `target="_blank"`
    if (target && target.getAttribute) {
      const linkTarget = target.getAttribute('target') || ''
      if (/\b_blank\b/i.test(linkTarget)) return
    }
    // Don't handle same page links/anchors
    const url = new URL(target.href)
    const to = url.pathname
    if (window.location.pathname !== to && $event.preventDefault) {
      $event.preventDefault()
      router.push(to)
    }
  }
}
