<script lang="ts" setup>
const props = defineProps<{
  related: {
    context: string
    in_depth: [
      {
        item: PageReference
      },
    ]
  }
}>()

const labels = reactive({
  context: 'Kontext',
  in_depth: 'Vertiefung',
})

const relatedItem = computed(() => {
  return props.related?.[0] ?? null
})

const showContext = computed(() => {
  return relatedItem.value?.context
})

const showInDepth = computed(() => {
  return (relatedItem.value?.in_depth?.length ?? 0) > 0
})

const showRelatedContent = computed(() => {
  return showContext.value || showInDepth.value
})
</script>

<template>
  <div v-if="showRelatedContent" class="related-content-section">
    <!-- NOTE: Structure used due to the repeater logic wich in turn is necessary to be able to limit in-depth list backendwise. Could use repeater-components but seemed overkill. -->
    <template
      v-for="(related, index) in props.related"
      :key="`related-${index}`"
    >
      <div v-if="showContext" class="context-section">
        <div class="label" v-text="labels.context" />
        <FieldText class="text" :text="related.context" />
      </div>
      <div v-if="showInDepth" class="in-depth-section">
        <div class="label" v-text="labels.in_depth" />
        <InDepthList :items="related.in_depth" />
      </div>
    </template>
  </div>
</template>

<style lang="scss" scoped>
// .related-content-section {}
</style>
