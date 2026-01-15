<script lang="ts" setup>
const props = defineProps<{
  related: {
    context: string
    in_depth: []
  }
}>()
</script>

<template>
  <div class="related-content-list">
    <!-- NOTE: Structure used due to the repeater logic wich in turn is necessary to be able to limit in-depth list backendwise. Could use repeater-components but seemed overkill. -->
    <template
      v-for="(related, index) in props.related"
      :key="`related-${index}`"
    >
      <FieldText :text="related.context" />
      <InDepthList :items="related.in_depth" />
    </template>
  </div>
</template>

<style lang="scss" scoped>
// .related-content-list {}
</style>
