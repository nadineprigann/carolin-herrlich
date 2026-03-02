<script lang="ts" setup>
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

interface Props {
  label: string // actual visibile label for the input for users
  id: string // string that is used to "connect" label, name, input and help/error text for a11y. should be unique on the page if multiple inputs are used
  value: string // value of the radio input
  modelValue?: string // current selected value from parent, needed to set checked state of the radio input
  name: string // name attr for the radio input. if multiple radios: has to be identical to group them together (single-select)
  help?: string // help text
  error?: string // error text
  placeholder?: string
  autocomplete?: string // autocomplete attr for input, e.g. "given-name". helps AT. see https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autocomplete#values
  required?: boolean // pass true if required
  emits?: boolean // whether to emit the entered value to the parent component. for now stay dumb and do not emit, can be added later if needed
  // item: PageReference
}

const props = withDefaults(defineProps<Props>(), {
  modelValue: '',
  required: false,
  autocomplete: 'off',
  help: '',
  error: '',
  placeholder: '',
  emits: false, // for now stay dumb and do not emit selected value to parent component. can be added later if needed
})

const emit = defineEmits(['update:modelValue'])

const checked = computed(() => {
  return props.modelValue === props.value
})

// const title = computed(() => {
//   return props.item ? props.item.fields.title : props.label
// })

// const id = computed(() => {
//   return `radio-${props.item ? props.item.fields.title : props.label}`
// })

// compute help and error texts for ARIA
// const help = computed(() => {
//   return `${props.id}-help`
// })

// const error = computed(() => {
//   return `${props.id}-error`
// })

// const model = computed(() => {
//   return `${props.id}-model`
// })

// const radioSelected = ref<'az' | 'za' | null>(null) // store selected value from v-model, can be used to emit to parent component if needed

// TODO: communicate filter to parent comp otherwise stay dumb
const selectFilter = () => {
  emit('update:modelValue', props.value)
}
</script>

<template>
  <input
    :id="props.id"
    :name="props.name"
    :value="props.value"
    type="radio"
    class="radio"
    :checked="checked"
    @change="selectFilter"
  />
  <!-- @click="selectFilter" -->
  <label :for="props.id" class="label" v-text="props.label" />
  <!-- <span class="label" v-text="title" /> -->
</template>

<style lang="scss" scoped>
.filter-radio {
  @include button-default;
}
</style>
