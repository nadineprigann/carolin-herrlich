<script lang="ts" setup>
const props = defineProps<{
  item: MatrixTypeAccordion
}>()

const showAccordion = computed(() => {
  return props.item.accordion != null
})
</script>

<template>
  <div v-if="showAccordion" class="field-matrix-type-accordion">
    <FieldText element="h4" :text="props.item.accordion.title" />
    <FieldText
      v-if="props.item.accordion.subtitle"
      element="h5"
      :text="props.item.accordion.subtitle"
    />
    <FieldMatrix :items="props.item.accordion.content" />
  </div>
</template>

<style lang="scss" scoped>
.field-matrix-type-accordion {
  @include center-content;
}
</style>
