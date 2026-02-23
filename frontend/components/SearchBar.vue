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
}

.input {
  @include input-default;

  // width: 100%;
}

.reset {
  &::before {
    display: block;

    // width: var(--gutter);
    // height: var(--gutter);
    content: var(--s-close);
  }
}
</style>
