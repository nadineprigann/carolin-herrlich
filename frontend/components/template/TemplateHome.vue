<script lang="ts" setup>
const props = defineProps<{
  data: Page
}>()
const { fields } = toRefs(props.data)
</script>

<template>
  <main class="template-home">
    <FieldText element="h2" :text="fields.title" />
  </main>
</template>

<style lang="scss" scoped>
// .template-home {}
</style>
