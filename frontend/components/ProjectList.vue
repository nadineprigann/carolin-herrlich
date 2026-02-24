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

  display: grid;
  grid-template-columns: repeat(1, minmax(auto, 1fr));

  @media (min-width: $mobile) {
    grid-template-columns: repeat(2, minmax(auto, 1fr));
  }

  @media (min-width: $tablet) {
    grid-template-columns: repeat(3, minmax(auto, 1fr));
  }

  @media (min-width: $desktop) {
    grid-template-columns: repeat(4, minmax(auto, 1fr));
  }
}
</style>
