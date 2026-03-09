// To stop scrolling when an overlay (nav, legal, filters, checkout, ...) is open
import { watch, onUnmounted, type Ref } from 'vue'

export function bodyOverflowLock(isVisible: Ref<boolean>) {
  const originalOverflow = document.body.style.overflow

  const stop = watch(
    isVisible,
    (visible) => {
      document.body.style.overflow = visible ? 'hidden' : originalOverflow
    },
    { immediate: true },
  )

  onDeactivated(() => {
    stop()
    document.body.style.overflow = originalOverflow
  })

  onUnmounted(() => {
    stop()
    document.body.style.overflow = originalOverflow
  })
}
