<script lang="ts" setup>
const props = defineProps<{
  // note: Note
}>()

const labels = reactive({
  placeholder: 'Suchen...',
})
</script>

<template>
  <!-- TODO: see insert -> search.vue -->
  <!-- <section class="search-bar"> -->
  <form class="search-bar" @submit.prevent>
    <input
      id="search"
      :placeholder="labels.placeholder"
      autocomplete="off"
      class="input"
      @input="debounceInput"
    />
    <button type="reset" class="reset" @click="clearResults" />
  </form>
  <!-- </section> -->
</template>

<style lang="scss" scoped>
.search-bar {
  display: grid;
  grid-template-columns: minmax(0, 1fr) auto;
  margin-left: var(--gutter-xl);
}

.input {
  @include input-default;

  // width: 100%;
}

.reset {
  @include button-reset;
  @include hover-default;
  @include focus-default;
  @include button-padding($top: 0, $bottom: 0, $left: 1rem, $right: 1rem);

  background-color: var(--grey);

  &::before {
    display: block;
    content: var(--l-close);
  }
}
</style>
