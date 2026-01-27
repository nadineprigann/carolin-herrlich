<script lang="ts" setup>
const props = defineProps<{
  items: OverviewItem[]
}>()
</script>

<template>
  <ul class="overview-list">
    <OverviewItem
      v-for="(item, index) in props.items"
      :key="`overview-item-${index}`"
      :item="item"
    />
  </ul>
</template>

<style lang="scss" scoped>
.overview-list {
  @include list-reset;
}
</style>
