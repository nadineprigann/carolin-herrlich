<script lang="ts" setup>
const props = defineProps<{
  items?: MatrixItem[]
  title?: string
}>()
</script>

<template>
  <div v-if="props.items?.length" class="field-matrix">
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
