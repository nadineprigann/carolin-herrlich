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
  overview: 'Übersicht',
})

// create nice ARIA label for AT
const ariaLabel = computed(() => {
  const dir = props.direction === 'prev' ? labels.prev : labels.next
  return `${dir}: ${props.item.meta.title}`
})

const isOverview = computed(() => {
  return props.item.meta.template === 'overview'
})

const overviewLabel = computed(() => {
  return isOverview.value ? `${labels.overview}: ${props.item.meta.title}` : ''
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
    <FieldText
      v-if="isOverview"
      element="span"
      :text="overviewLabel"
      class="title"
    />
    <FieldText
      v-else
      element="span"
      :text="props.item.meta.title"
      class="title"
    />
  </button>
</template>

<style lang="scss" scoped>
.chapter-nav-button {
  @include button-reset;
  @include highlight-element($radius: 3rem);
  @include button-padding(
    $top: 0.4em,
    $bottom: var(--spacing-xs),
    $left: var(--spacing-l),
    $right: var(--spacing-l)
  );

  max-width: 100%;

  &.is-prev {
    grid-column: 1;
    justify-self: start;
  }

  &.is-next {
    grid-column: 2;
    justify-self: end;
  }
}

.title {
  display: flex;
  align-items: center;
  min-width: 0; // to allow the title to shrink and prevent overflow of the button, especially for long titles, in combination with overflow-wrap
  hyphens: auto; // to allow hyphenation of long words for better breaking and wrapping of text, especially for long titles
  word-break: break-word; // better than overflow-wrap, to prevent overflow of long titles, allow breaking and wrapping of text
  white-space: normal;

  &::before,
  &::after {
    display: inline-block;

    // margin-top: -0.2em;
    font-size: 1.2em;
  }

  .is-prev & {
    &::before {
      margin-right: var(--gutter-base);
      content: var(--s-arrow-right);
      transform: scale(-1, 1);
    }
  }

  .is-next & {
    &::after {
      margin-left: var(--gutter-base);
      font-size: 1.5em;
      content: var(--s-arrow-right);
    }
  }
}
</style>
