<script lang="ts" setup>
const props = defineProps<{
  children?: ProjectItem[]
}>()
</script>

<template>
  <ul class="project-item-list">
    <ProjectItem
      v-for="(child, index) in props.children"
      :key="`child-${index}`"
      :child="child"
    />
  </ul>
</template>

<style lang="scss" scoped>
.project-item-list {
  @include list-reset;
}
</style>
