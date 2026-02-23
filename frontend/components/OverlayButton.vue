<script lang="ts" setup>
const props = defineProps<{
  url?: string
  overlay: 'checkout' | 'filter' | 'project'
}>()

const label = reactive({
  refine: 'Verfeinern',
})

const openOverlay = () => {
  layout.value.openOverlay[props.overlay] =
    !layout.value.openOverlay[props.overlay]
}

const buttonClass = computed(() => [
  'refine-button',
  `refine-button-${props.overlay}`,
])
</script>

<template>
  <!-- TODO: temporarily opens overlay to check-out via mail. later: navigate to shop detail of item this button was used (prop!) -->
  <button class="button" :class="buttonClass" @click="openOverlay">
    <span class="label" v-text="label.refine" />
  </button>
</template>

<style lang="scss" scoped>
.refine-button {
  @include button-default;

  // &-checkout { }
  // &-filter { }
  // &-project { }
}
</style>
