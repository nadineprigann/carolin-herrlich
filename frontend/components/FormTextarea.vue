<script lang="ts" setup>
// const layoutStore = useLayoutStore()
// const { layout } = storeToRefs(layoutStore)

interface Props {
  label: string // actual visibile label for the input for users
  id: string // string that is used to "connect" label, name, input and help/error text for a11y. should be unique on the page if multiple inputs are used
  help: string // help text
  error?: string // error text
  placeholder: string
  autocomplete?: string // autocomplete attr for input, e.g. "given-name". helps AT. see https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autocomplete#values
  required?: boolean // pass true if required
  emits?: boolean // whether to emit the entered value to the parent component. for now stay dumb and do not emit, can be added later if needed
  modelValue?: string
  resize?: 'none' | 'both' | 'horizontal' | 'vertical' // whether to allow resizing of the textarea, default is none
}

const props = withDefaults(defineProps<Props>(), {
  required: false,
  autocomplete: 'off',
  emit: false, // for now stay dumb and do not emit selected value to parent component. can be added later if needed
  modelValue: '', // for v-model binding, can be used by parent component to get the entered value if emit is set to true
  error: '',
})

const emit = defineEmits(['update:modelValue'])

// compute help and error texts for ARIA
const help = computed(() => {
  return `${props.id}-help`
})

const error = computed(() => {
  return `${props.id}-error`
})
</script>

<template>
  <div class="form-textarea">
    <label :for="props.id" class="label" v-text="props.label" />
    <textarea
      :id="props.id"
      type="text"
      :name="props.id"
      :autocomplete="props.autocomplete"
      :placeholder="props.placeholder"
      class="textarea"
      :aria-describedby="`${help} ${error}`"
      :required="props.required"
      :value="props.modelValue"
      @input="
        emit('update:modelValue', ($event.target as HTMLInputElement).value)
      "
    />
    <FieldText :id="`${help}`" class="help" element="p" :text="props.help" />
    <!-- <FieldText
      v-if="hasError"
      :id="`${error}`"
      class="error"
      element="p"
      :text="props.error"
    /> -->
  </div>
</template>

<style lang="scss" scoped>
.form-textarea {
  display: flex;
  flex-direction: column;
  grid-column: span 1;
  margin-bottom: var(--gutter-m);
}

.textarea {
  @include input-default;

  margin: calc(var(--gutter-base) / 2) 0;
  resize: vertical;
}

.label,
::placeholder,
.help,
.error {
  @include ff-sans;
}

.label,
.help,
.error {
  @include fs-small;
  @include ff-sans;
}

.help,
::placeholder {
  color: var(--disabled-color);
}

.error {
  color: var(--error-color);
}
</style>
