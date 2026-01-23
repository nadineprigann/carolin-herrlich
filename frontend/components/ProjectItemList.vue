<script lang="ts" setup>
const props = defineProps<{
  children?: ProjectItem[]
}>()
</script>

<template>
  <div class="project-item-list">
    <ProjectItem
      v-for="(child, index) in props.children"
      :key="`child-${index}`"
      :child="child"
    />
  </div>
</template>

<style lang="scss" scoped>
// .project-item-list {}
</style>
