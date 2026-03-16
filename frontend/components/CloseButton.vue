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
  @include text-focus;
  @include text-hover;

  position: relative;
  z-index: var(--xxl-overlay);
  display: flex;
  justify-self: flex-end;

  // padding-right: var(--gutter-s);

  @media (min-width: $tablet) {
    @include button-padding(
      $top: 0,
      $bottom: 0,
      $left: 0,
      $right: var(--gutter-m)
    );

    // check imprint and privacy when changing this in another component
  }

  &::before {
    margin-top: -0.3em;
    font-size: 1.2em;
    content: var(--l-close);
  }
}
</style>
