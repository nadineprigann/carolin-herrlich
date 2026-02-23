<script lang="ts" setup>
const props = defineProps<{
  item: MatrixTypeAccordion
}>()

const accordionVisible = ref(false)

const showAccordion = computed(() => {
  return props.item.accordion != null
})

const toggleAccordion = () => {
  accordionVisible.value = !accordionVisible.value
}
</script>

<template>
  <div v-if="showAccordion" class="field-matrix-type-accordion">
    <FieldText
      element="h4"
      :text="props.item.accordion.title"
      class="title"
      @click="toggleAccordion"
    />
    <FieldText
      v-if="props.item.accordion.subtitle"
      element="h5"
      :text="props.item.accordion.subtitle"
      class="subtitle"
    />
    <FieldMatrix
      v-if="accordionVisible"
      :items="props.item.accordion.content"
      class="content"
    />
  </div>
</template>

<style lang="scss" scoped>
.field-matrix-type-accordion {
  @include center-content;
}
</style>
