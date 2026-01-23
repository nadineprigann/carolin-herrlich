<script lang="ts" setup>
const props = defineProps<{
  children?: childItem[]
}>()
</script>

<template>
  <div class="child-list">
    <ChildItem
      v-for="(child, index) in props.children"
      :key="`child-${index}`"
      :child="child"
    />
  </div>
</template>

<style lang="scss" scoped>
// .child-list {}
</style>
