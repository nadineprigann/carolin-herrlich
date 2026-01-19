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
</script>

<template>
  <div class="related-content-section">
    <!-- NOTE: Structure used due to the repeater logic wich in turn is necessary to be able to limit in-depth list backendwise. Could use repeater-components but seemed overkill. -->
    <template
      v-for="(related, index) in props.related"
      :key="`related-${index}`"
    >
      <div class="context-section">
        <div class="label" v-html="labels.context" />
        <FieldText class="text" :text="related.context" />
      </div>
      <div class="in_depth-section">
        <div class="label" v-html="labels.in_depth" />
        <InDepthList :items="related.in_depth" />
      </div>
    </template>
  </div>
</template>

<style lang="scss" scoped>
// .related-content-section {}
</style>
