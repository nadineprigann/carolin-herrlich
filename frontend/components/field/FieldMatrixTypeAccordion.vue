<script lang="ts" setup>
const props = defineProps<{
  item: MatrixTypeAccordion
}>()

const accordionClass = computed(() => {
  return [
    'field-matrix-type-accordion',
    accordionVisible.value ? 'is-open' : '',
  ]
})

const accordionVisible = ref(false)

const showAccordion = computed(() => {
  return props.item.accordion != null
})

const toggleAccordion = () => {
  accordionVisible.value = !accordionVisible.value
}
</script>

<template>
  <div v-if="showAccordion" :class="accordionClass">
    <div class="header" @click="toggleAccordion">
      <FieldText
        element="h4"
        :text="props.item.accordion.title"
        class="title"
      />
      <FieldText
        v-if="props.item.accordion.subtitle"
        element="h5"
        :text="props.item.accordion.subtitle"
        class="subtitle"
      />
    </div>
    <FieldMatrix
      v-if="accordionVisible"
      :items="props.item.accordion.content"
      class="content"
      :accordion-title="props.item.accordion.title"
    />
  </div>
</template>

<style lang="scss" scoped>
.field-matrix-type-accordion {
  @include center-content;

  position: relative;
}

.header {
  @include toggle-icon;
}

.title,
.subtitle {
  @include ff-sans;
}

.title {
  @include fs-medium;
}

.subtitle {
  @include fs-small;
}
</style>
