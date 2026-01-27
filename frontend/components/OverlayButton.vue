<script lang="ts" setup>
const layoutStore = useLayoutStore()
const props = defineProps<{
  url?: string
  overlay: 'checkout' | 'blog' | 'tools' | 'events' | 'project'
  label: string
}>()

const handleClick = () => {
  layoutStore.layout.openOverlay[props.overlay] = true
}

const buttonClass = computed(() => [
  'overlay-button',
  `overlay-button-${props.overlay}`,
])
</script>

<template>
  <!-- TODO: temporarily opens overlay to check-out via mail. later: navigate to shop detail of item this button was used (prop!) -->
  <button :class="buttonClass" type="button" @click="handleClick">
    {{ props.label }}
  </button>
</template>

<style lang="scss" scoped>
.overlay-button {
  // &-checkout { }
  // &-blog { }
  // &-tools { }
  // &-events { }
  // &-project { }
}
</style>
