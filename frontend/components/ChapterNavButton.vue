<script lang="ts" setup>
import { useRouter } from 'vue-router'
const router = useRouter()

const props = defineProps<{
  item: Route
  direction: 'prev' | 'next'
}>()

const buttonClass = computed(() => {
  return ['chapter-nav-button', `chapter-nav-button-${props.direction}`]
})

const labels = reactive({
  prev: 'Zurück',
  next: 'Weiter',
})

// create nice ARIA label for AT
const ariaLabel = computed(() => {
  const dir = props.direction === 'prev' ? labels.prev : labels.next
  return `${dir}: ${props.item.meta.title}`
})

const navigate = () => {
  router.push(props.item.path)
}
</script>

<template>
  <button
    type="button"
    :class="buttonClass"
    :aria-label="ariaLabel"
    :direction="props.direction"
    @click="navigate"
  >
    <FieldText element="span" :text="props.item.meta.title" />
  </button>
</template>

<style lang="scss" scoped>
.chapter-nav-button {
  @include button-default;

  &-prev {
    grid-column: 1;
  }

  &-next {
    grid-column: 2;
  }
}
</style>
