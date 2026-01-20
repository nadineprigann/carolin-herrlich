<script lang="ts" setup>
const props = defineProps<{
  items: OverviewItem[]
}>()
</script>

<template>
  <div class="overview-list">
    <OverviewItem
      v-for="(item, index) in props.items"
      :key="`overview-item-${index}`"
      :item="item"
    />
  </div>
</template>

<style lang="scss" scoped>
// .overview-list {}
</style>
