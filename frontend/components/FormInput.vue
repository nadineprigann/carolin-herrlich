<script lang="ts" setup>
// const layoutStore = useLayoutStore()
// const { layout } = storeToRefs(layoutStore)

interface Props {
  label: string // actual visibile label for the input for users
  id: string // string that is used to "connect" label, name, input and help/error text for a11y. should be unique on the page if multiple inputs are used
  help: string // help text
  error: string // error text
  placeholder: string
  autocomplete?: string // autocomplete attr for input, e.g. "given-name". helps AT. see https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autocomplete#values
  required?: boolean // pass true if required
}

const props = withDefaults(defineProps<Props>(), {
  required: false,
  autocomplete: 'off',
})

// compute help and error texts for ARIA
const help = computed(() => {
  return `${props.id}-help`
})

const error = computed(() => {
  return `${props.id}-error`
})
</script>

<template>
  <div class="filter-input">
    <label :for="props.id" class="label" v-text="props.label" />
    <input
      :id="props.id"
      type="text"
      :name="props.id"
      :autocomplete="props.autocomplete"
      :placeholder="props.placeholder"
      class="input"
      :aria-describedby="`${help} ${error}`"
      :required="props.required"
    />
    <FieldText :id="`${help}`" class="help" element="p" :text="props.help" />
    <FieldText
      v-if="hasError"
      :id="`${error}`"
      class="error"
      element="p"
      :text="props.error"
    />
  </div>
</template>

<style lang="scss" scoped>
.filter-input {
  display: flex;
  flex-direction: column;
  grid-column: span 1;
}

.input {
  @include input-default;
}
</style>
