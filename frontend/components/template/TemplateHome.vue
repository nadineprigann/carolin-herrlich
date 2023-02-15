<script lang="ts" setup>
const props = defineProps<{
  data: Page
}>()
const { fields } = toRefs(props.data)
</script>

<template>
  <div class="template-home">
    <!-- eslint-disable-next-line vue/no-v-html -->
    <h2 v-html="fields.title" />
  </div>
</template>

<style lang="scss" scoped>
// .template-home {}
</style>
