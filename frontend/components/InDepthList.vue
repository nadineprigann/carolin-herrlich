<script lang="ts" setup>
const props = defineProps<{
  items: {
    item: PageReference
  }
}>()
// NOTE: Structure used due to the repeater logic wich in turn is necessary to be able to limit in-depth list backendwise. Could use repeater-components but seemed overkill.
const items = computed(() => {
  return props.items[0] ?? null
})
</script>

<template>
  <ul class="in-depth-list">
    <InDepthItem
      v-for="item in items"
      :key="`in-depth-item-${item.meta.id}`"
      :item="item"
    />
  </ul>
</template>

<style lang="scss" scoped>
.in-depth-list {
  @include list-reset;
}
</style>
