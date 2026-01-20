<script lang="ts" setup>
const props = defineProps<{
  items: {
    item: PageReference
  }
}>()
</script>

<template>
  <div class="in-depth-list">
    <!-- NOTE: Structure used due to the repeater logic wich in turn is necessary to be able to limit in-depth list backendwise. Could use repeater-components but seemed overkill. -->
    <template v-for="in_depth in props.items">
      <InDepthItem
        v-for="(item, index) in in_depth"
        :key="`in-depth-item-${index}`"
        :item="item"
      />
    </template>
  </div>
</template>

<style lang="scss" scoped>
// .in-depth-list {}
</style>
