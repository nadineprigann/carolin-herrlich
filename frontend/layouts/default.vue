<script lang="ts" setup>
import { watch, nextTick } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()

const scrollToHash = async () => {
  const hash = route.hash
  if (!hash) return

  // wait for the page to render before trying to scroll to the element
  await nextTick()

  // add a slight delay to ensure any transitions have completed (adjust as needed)
  setTimeout(() => {
    const el = document.querySelector(hash)
    if (el) {
      el.scrollIntoView({
        behavior: 'smooth',
        block: 'start',
      })
    }
  }, 700) // adjusted to page transition duration of 450ms, defined in _transntions.scss plus some buffer time
}

// run on first load
onMounted(scrollToHash)

// run when hash changes
watch(
  () => route.fullPath,
  () => {
    scrollToHash()
  },
)
</script>

<template>
  <div class="layout-default">
    <AppHeader />
    <slot />
  </div>
</template>

<style lang="scss" scoped>
.layout-default {
  position: relative;
  display: grid;
  grid-template-rows: auto minmax(0, 1fr); /* header, then main */
  height: 100%;
  min-height: 0;
}
</style>
