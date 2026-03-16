<script lang="ts" setup>
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const props = defineProps<{
  url?: string
  label?: string
  overlay: 'checkout' | 'filter'
  accordionTitle?: string
}>()

const altLabel = reactive({
  refine: 'Verfeinern',
})

const openOverlay = () => {
  // when opening the checkout overlay, set title in store to accordion title if available to make sure that no matter the state (open / closed) of the accordion, the overlay title is correct -> fetch it right before opening the overlay accordionTitle gets passed down all the way from FieldMatrix.vue
  if (props.accordionTitle)
    layout.value.openOverlay.checkoutTitle = props.accordionTitle
  // always use deterministic toggling for global overlays like checkout, so that they open and close correctly no matter the current state of the accordion (if button is in accordion) or other components.
  layout.value.openOverlay[props.overlay] = true
}

const buttonClass = computed(() => [
  'overlay-button',
  `overlay-button-${props.overlay}`,
])

// render either label from using this button within accordions, event OR use alt label
const buttonLabel = computed(() => {
  return props.label ? props.label : altLabel.refine
})
</script>

<template>
  <!-- TODO: temporarily opens overlay to check-out via mail. later: navigate to shop detail of item this button was used (prop!) -->
  <button
    type="button "
    class="button"
    :class="buttonClass"
    @click="openOverlay"
  >
    <span class="label" v-text="buttonLabel" />
  </button>
</template>

<style lang="scss" scoped>
.overlay-button {
  @include button-default;

  display: block;
  max-width: max-content;

  // &-checkout { }
  // &-filter { }
  // &-project { }
}
</style>
