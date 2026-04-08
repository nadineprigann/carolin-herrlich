<script lang="ts" setup>
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const props = defineProps<{
  filter: Category
  title?: string
  selected?: boolean
  disabled?: boolean
}>()

const emit = defineEmits<{
  (e: 'select-filter', filter?: Category): void
}>()

const title = computed(() => {
  return props.filter ? props.filter.fields.title : props.title
})

// TODO: communicate filter to parent comp to collect it in draft
const selectFilter = () => {
  emit('select-filter', props.filter)
}
</script>

<template>
  <button
    :id="props.filter.meta.id"
    type="button"
    :name="props.filter.meta.id"
    :value="props.filter.meta.name"
    :disabled="props.disabled"
    class="form-button"
    :aria-pressed="props.selected"
    @click="selectFilter"
  >
    <span class="label" v-text="title" />
  </button>
</template>

<style lang="scss" scoped>
.form-button {
  @include button-default;
}
</style>
