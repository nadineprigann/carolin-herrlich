<script lang="ts" setup>
const props = defineProps<{
  item: MatrixTypeAccordion
}>()
</script>

<template>
  <!-- TODO: could be improved by a flatter output from backend -->
  <div class="field-matrix-type-accordion">
    <FieldText :text="props.item.accordion.title" />
    <FieldText
      v-if="props.item.accordion.subtitle"
      :text="props.item.accordion.subtitle"
    />
    <FieldMatrix :items="props.item.accordion.content" />
  </div>
</template>

<style lang="scss" scoped>
// .field-matrix-type-accordion {}
</style>
