<script lang="ts" setup>
const props = defineProps<{
  items: Route
}>()

const showChapterNav = computed(() => {
  return hasPrev.value || hasNext.value
})

const hasPrev = computed(() => {
  return props.items.prev !== null
})

const hasNext = computed(() => {
  return props.items.next !== null
})
</script>

<template>
  <nav
    v-if="showChapterNav"
    class="chapter-nav"
    aria-label="Chapter navigation"
  >
    <!-- do not loop through items to be able to render each button separately for better control over. position, rendering and ARIA labels -->
    <ChapterNavButton
      v-if="hasPrev"
      :key="`chapter-nav-button-prev`"
      :item="props.items.prev"
      :direction="'prev'"
    />
    <ChapterNavButton
      v-if="hasNext"
      :key="`chapter-nav-button-next`"
      :item="props.items.next"
      :direction="'next'"
    />
  </nav>
</template>

<style lang="scss" scoped>
.chapter-nav {
  @include center-content;

  display: grid;
  grid-template-columns: repeat(
    2,
    minmax(0, 1fr)
  ); // only  use as much space as each button needs

  gap: var(--gutter-base);
  justify-content: space-between;
  padding-bottom: calc(
    var(--gutter-base) * 5
  ); // use padding here to prevent grid to "cut off" margin and respect spacing, when there's no related content, this is last element on the page and should have more spacing to the end of the page

  @media (min-width: $tablet) {
    gap: var(--gutter-m);
    padding-bottom: calc(
      var(--gutter-base) * 10
    ); // use padding here to prevent grid to "cut off" margin and respect spacing
  }
}
</style>
