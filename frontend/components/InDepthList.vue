<script lang="ts" setup>
const props = defineProps<{
  items: InDepthItem[]
}>()
</script>

<template>
  <ul class="in-depth-list">
    <InDepthItem
      v-for="(item, index) in props.items"
      :key="`in-depth-item-${index}`"
      :item="item"
    />
  </ul>
</template>

<style lang="scss" scoped>
.in-depth-list {
  @include list-reset;
}
</style>
