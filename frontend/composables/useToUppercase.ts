export function useToUppercase() {
  function toUppercase(text) {
    if (typeof text !== 'string' || text.length === 0) return ''
    return text.charAt(0).toUpperCase() + text.slice(1)
  }

  return {
    toUppercase,
  }
}
