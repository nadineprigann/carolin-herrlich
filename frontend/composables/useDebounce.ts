import { onUnmounted } from 'vue'

export const useDebounce = () => {
  const timeouts = new Set()

  const debounce = (fn, delay = 150) => {
    let timeout

    const debounced = (...args) => {
      clearTimeout(timeout)
      timeout = setTimeout(() => fn(...args), delay)
    }

    timeouts.add(timeout)

    return debounced
  }

  onUnmounted(() => {
    timeouts.forEach(clearTimeout)
    timeouts.clear()
  })

  return { debounce }
}
