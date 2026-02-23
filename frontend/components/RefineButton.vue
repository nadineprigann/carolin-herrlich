<script lang="ts" setup>
const props = defineProps<{
  // item:
}>()

const label = reactive({
  refine: 'Verfeinern',
})
</script>

<template>
  <button class="button" @click="openOverlay">
    <span class="label" v-text="label.refine" />
  </button>
</template>

<style lang="scss" scoped>
.refine-button {
  @include button-default;
}
</style>
