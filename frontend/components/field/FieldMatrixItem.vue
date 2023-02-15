<script lang="ts" setup>
const props = defineProps<{
  item: {
    type: string
  }
}>()

// Pick component based on matrix type
// TODO: Ideally, this would be possible by just passing the component name as a string
// see https://nuxt.com/docs/guide/directory-structure/components/#dynamic-components
const FieldMatrixTypeImages = resolveComponent('FieldMatrixTypeImages')
const FieldMatrixTypeText = resolveComponent('FieldMatrixTypeText')
// Register new types here...

const type = computed(() => {
  if (props.item.type === 'type_images') return FieldMatrixTypeImages
  if (props.item.type === 'type_text') return FieldMatrixTypeText
  // ... and match them here
})
</script>

<template>
  <component :is="type" :item="item" />
</template>
