<script lang="ts" setup>
const props = defineProps<{
  item: {
    type: string
    text: string
  }
}>()
</script>

<template>
  <div class="field-matrix-type-text">
    <BaseTextarea :text="props.item.text" />
  </div>
</template>

<style lang="scss" scoped>
// .field-matrix-type-text {}
</style>
