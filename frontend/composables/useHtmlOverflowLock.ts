// To stop scrolling when an overlay (nav, legal, filters, checkout, ...) is open
import { watch, onUnmounted, type Ref } from 'vue'

export function htmlOverflowLock(isVisible: Ref<boolean>) {
  // a composable can be imported and executed even before a component is mounted. in that case, document is not defined. therfore, return when undefined and only ever access document during the watcher and lifecycle hooks, which are only executed when the component is mounted.
  if (typeof document === 'undefined') return

  const originalOverflow = document.documentElement.style.overflow

  const stop = watch(
    isVisible,
    (visible) => {
      document.documentElement.style.overflow = visible
        ? 'hidden'
        : originalOverflow
    },
    { immediate: true },
  )

  onDeactivated(() => {
    stop()
    document.documentElement.style.overflow = originalOverflow
  })

  onUnmounted(() => {
    stop()
    document.documentElement.style.overflow = originalOverflow
  })
}
