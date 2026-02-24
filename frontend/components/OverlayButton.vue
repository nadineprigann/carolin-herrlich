<script lang="ts" setup>
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const props = defineProps<{
  url?: string
  label?: string
  overlay: 'checkout' | 'filter'
}>()

const altLabel = reactive({
  refine: 'Verfeinern',
})

const openOverlay = () => {
  layout.value.openOverlay[props.overlay] =
    !layout.value.openOverlay[props.overlay]
}

const buttonClass = computed(() => [
  'overlay-button',
  `overlay-button-${props.overlay}`,
])

const buttonLabel = computed(() => {
  return props.label ? props.label : altLabel.refine
})
</script>

<template>
  <!-- TODO: temporarily opens overlay to check-out via mail. later: navigate to shop detail of item this button was used (prop!) -->
  <button class="button" :class="buttonClass" @click="openOverlay">
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
