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
  <section v-if="showRelatedContent" class="related-content-section">
    <!-- NOTE: Structure used due to the repeater logic wich in turn is necessary to be able to limit in-depth list backendwise. Could use repeater-components but seemed overkill. -->
    <template
      v-for="(content, index) in props.related"
      :key="`related-${index}`"
    >
      <section v-if="showContext" class="context-section">
        <FieldText element="h4" class="label" :text="labels.context" />
        <FieldTextarea class="text" :text="content.context" />
      </section>
      <section v-if="showInDepth" class="in-depth-section">
        <FieldText element="h4" class="label" :text="labels.in_depth" />
        <InDepthList :items="content.in_depth" />
      </section>
    </template>
  </section>
</template>

<style lang="scss" scoped>
// .related-content-section {}
</style>
