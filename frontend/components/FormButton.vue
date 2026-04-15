<script lang="ts" setup>
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const props = defineProps<{
  filter: PageReference
  title?: string
  selected: boolean
  disabled?: boolean
}>()

const emit = defineEmits<{
  (e: 'select-filter', filter?: PageReference): void
}>()

const title = computed(() => {
  return props.filter ? props.filter.fields.title : props.title
})

// communicate filter to parent comp to collect it in draft
const selectFilter = () => {
  emit('select-filter', props.filter)
}

const classes = computed(() => {
  return {
    button: ['form-button', props.selected ? 'is-selected' : ''],
  }
})
</script>

<template>
  <button
    :id="props.filter.meta.id"
    type="button"
    :name="props.filter.meta.id"
    :value="props.filter.meta.name"
    :disabled="props.disabled"
    :class="classes.button"
    :aria-pressed="props.selected"
    @click="selectFilter"
  >
    <span class="label" v-text="title" />
  </button>
</template>

<style lang="scss" scoped>
.form-button {
  @include button-default;
  @include hover-default;
  @include focus-default;

  &.is-selected {
    background-color: var(--grey);
    border-color: var(--highlight-color);
  }
}
</style>
