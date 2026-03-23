<script lang="ts" setup>
const props = defineProps<{
  item: MatrixTypeAccordion
}>()

const route = useRoute()
const router = useRouter()

const accordionClass = computed(() => {
  return [
    'field-matrix-type-accordion',
    accordionVisible.value ? 'is-open' : '',
  ]
})

const accordionVisible = ref(false)

const showAccordion = computed(() => {
  return props.item.accordion != null && props.item.accordion.content.length > 0
})

const toggleAccordion = () => {
  if (accordionVisible.value) {
    // closing manually
    accordionVisible.value = false
    // and when this is the current accordion, remove hash set from scroll to in default.vue when opening the accordion via anchor link
    if (isCurrent.value) router.replace({ hash: '' })
  } else {
    // opening manually
    accordionVisible.value = true
  }
}

const isCurrent = computed(() => {
  return route.hash.replace('#', '') === props.item.id // remove # to make the two comparable
})

watch(
  () => route.hash,
  () => {
    // wait for DOM to dfully settle before checking the state and opening th accordion
    nextTick(() => {
      if (isCurrent.value) {
        accordionVisible.value = true
      }
    })
  },
  { immediate: true },
)
</script>

<template>
  <div v-if="showAccordion" :id="item.id" :class="accordionClass">
    <button type="button" class="header" @click="toggleAccordion">
      <FieldText
        element="h3"
        :text="props.item.accordion.title"
        class="title"
      />
      <FieldText
        v-if="props.item.accordion.subtitle"
        element="h4"
        :text="props.item.accordion.subtitle"
        class="subtitle"
      />
    </button>
    <FieldMatrix
      v-show="accordionVisible"
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
  scroll-margin-top: calc(
    var(--blank-line) * 5
  ); // to prevent the header from being hidden behind the fixed header when linked to via anchor link
}

.header {
  @include toggle-icon;
  @include text-focus;
  @include text-hover;

  display: flex;
  flex-wrap: wrap;
  width: 100%;
  padding-bottom: var(--accordion-title-spacing);
  margin-bottom: var(--gutter-s);
  border-bottom: 1px dashed var(--black);
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

  padding-left: var(--gutter-s); // has to match with indent on small screens
}
</style>
