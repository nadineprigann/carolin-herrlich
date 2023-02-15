<script lang="ts" setup>
const props = defineProps<{
  items: []
}>()
</script>

<template>
  <div class="field-matrix">
    <FieldMatrixItem
      v-for="(item, index) in props.items"
      :key="`item-${index}`"
      :item="item"
    />
  </div>
</template>

<style lang="scss" scoped>
// .field-matrix {}
</style>
