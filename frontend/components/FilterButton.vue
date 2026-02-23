<script lang="ts" setup>
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const props = defineProps<{
  filter?: Category
  title?: string
  selected: boolean
}>()

// const emit = defineEmits<{
//   (e: 'selected-filter', filter: Category): void
// }>()

const title = computed(() => {
  return props.filter ? props.filter.fields.title : props.title
})

// TODO: communicate filter to parent comp otherwise stay dumb
const selectFilter = () => {
  // props.filter
  //   ? emit('selected-filter', null)
  //   : emit('selected-filter', props.filter)
}
</script>

<template>
  <button
    type="button"
    class="filter-button"
    :aria-pressed="props.selected"
    @click="selectFilter"
  >
    <span class="label" v-text="title" />
  </button>
</template>

<style lang="scss" scoped>
.filter-button {
  @include button-default;
}
</style>
