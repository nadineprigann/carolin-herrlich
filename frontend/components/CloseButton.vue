<script lang="ts" setup>
const props = defineProps<{
  overlayTitle: string
}>()

const ariaLabel = computed(() => `${props.overlayTitle} schließen`)
</script>

<template>
  <button type="button" class="close" :aria-label="ariaLabel">
    <span class="label" />
  </button>
</template>

<style lang="scss" scoped>
.close {
  @include button-reset;

  position: relative;
  z-index: var(--xxl-overlay);
  justify-self: flex-end;
  padding: var(--gutter);

  &::before {
    content: var(--l-close);
  }
}
</style>
