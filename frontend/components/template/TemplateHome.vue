<script lang="ts" setup>
const props = defineProps<{
  data: Page
}>()
const { fields } = toRefs(props.data)
</script>

<template>
  <main class="template-home">
    <!-- eslint-disable-next-line vue/no-v-html -->
    <h2 v-html="fields.title" />
  </main>
</template>

<style lang="scss" scoped>
// .template-home {}
</style>
