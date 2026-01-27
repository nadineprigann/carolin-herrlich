<script lang="ts" setup>
const props = defineProps<{
  children?: childItem[]
}>()
</script>

<template>
  <ul class="child-list">
    <ChildItem
      v-for="(child, index) in props.children"
      :key="`child-${index}`"
      :child="child"
    />
  </ul>
</template>

<style lang="scss" scoped>
.child-list {
  @include list-reset;
}
</style>
