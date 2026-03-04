<script lang="ts" setup>
import { useRouter } from 'vue-router'
const router = useRouter()

const props = defineProps<{
  item: Route
  direction: 'prev' | 'next'
}>()

const buttonClass = computed(() => {
  return [
    'chapter-nav-button',
    props.direction === 'prev' ? 'is-prev' : 'is-next',
  ]
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
    <FieldText element="span" :text="props.item.meta.title" class="title" />
  </button>
</template>

<style lang="scss" scoped>
.chapter-nav-button {
  @include button-reset;
  @include highlight-element($radius: 1em);
}

.title {
  display: flex;
  align-items: center;

  &::before,
  &::after {
    display: inline-block;

    // margin-top: -0.2em;
    font-size: 1.2em;
  }

  .is-prev & {
    &::before {
      content: var(--s-arrow-right);
      transform: scale(-1, 1);
    }
  }

  .is-next & {
    &::after {
      font-size: 1.5em;
      content: var(--s-arrow-right);
    }
  }
}
</style>
