<script lang="ts" setup>
const formStore = useFormStore()
const { selected } = storeToRefs(formStore)

const props = defineProps<{
  // item:
  overlay: 'checkout' | 'filter'
}>()

const hasFilters = computed(() => {
  return selected.value.categories.length > 0
})

const classes = computed(() => {
  return {
    button: ['button', hasFilters.value ? 'is-active' : ''],
  }
})
</script>

<template>
  <section class="filter-bar">
    <OverlayButton :overlay="props.overlay" :class="classes.button" />
    <!-- <SearchBar /> -->
  </section>
</template>

<style lang="scss" scoped>
.filter-bar {
  @include center-content;

  display: flex;
  margin-bottom: var(--gutter-xl);

  @media (min-width: $medium) {
    margin-bottom: calc(var(--gutter-base) * 5);
  }
}

.button {
  &.is-active {
    position: relative;

    &::after {
      position: absolute;
      top: 0;
      right: 0;
      padding: var(--spacing-xxs);
      content: '';
      background-color: var(--highlight-color);
      border-radius: 100%;
    }
  }
}
</style>
