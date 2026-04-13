<script lang="ts" setup>
import { watch, nextTick } from 'vue'
import { useRoute } from 'vue-router'
const { resetQuery } = useUpdateQuery()

const route = useRoute()
const headerHeight = ref(0)
const cleared = useState('query-cleared', () => false)

const handleHeaderHeight = (height) => {
  headerHeight.value = height
}

const style = computed(() => {
  return {
    // works cuz the custom property is defined in the root of the layout and cascades down to all children, so it can be used in any component without having to pass it down via props or provide/inject
    '--header-height': headerHeight.value + 'px',
  }
})

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

onMounted(async () => {
  if (!cleared.value) {
    await resetQuery()
    cleared.value = true
  }

  // run on first load and only after resetting the query to ensure correct scroll position after page transition (especially when coming from a page with filters, which would otherwise cause the scroll position to be off because of the filter overlay)
  scrollToHash()
})

// run when hash changes
watch(
  () => route.fullPath,
  () => {
    scrollToHash()
  },
)
</script>

<template>
  <div class="layout-default" :style="style">
    <AppHeader @header-height="handleHeaderHeight" />
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
