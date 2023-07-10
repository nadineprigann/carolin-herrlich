<script lang="ts" setup>
const props = defineProps<{
  text?: string
}>()
</script>

<template>
  <!-- eslint-disable vue/no-v-html -->
  <div
    v-if="props.text"
    class="field-textarea"
    @click="delegateLinks"
    v-html="props.text"
  />
</template>

<style lang="scss" scoped>
.field-textarea {
  // :deep() is needed to expose DOM elements inside a v-html
  :deep(h3),
  :deep(h4) {
    margin-bottom: var(--blank-line);
  }

  :deep(p) {
    &:not(:last-child) {
      margin-bottom: var(--blank-line);
    }

    // Custom backend editor class
    // &.small {}
  }

  :deep(a) {
    @include link-default;
  }
}
</style>
