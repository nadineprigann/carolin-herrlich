<script lang="ts" setup>
const props = defineProps<{
  note: Note
}>()
</script>

<template>
  <section class="note-section">
    <div class="note">
      <span class="caption" v-text="props.note.number" />
      <span class="text" v-html="props.note.text" />
    </div>
    <button
      type="button"
      class="button"
      aria-label="Fußnote schließen"
      @click="closeNote"
    />
  </section>
</template>

<style lang="scss" scoped>
.note-section {
  position: fixed;
  bottom: 0;
  left: 0;
  display: flex;
  width: 100%;
}

.note {
  display: grid;
  grid-template-columns: 3em 1fr;
  padding-right: 4em; /* add some space for the close button */
}

.button {
  @include button-reset;

  position: absolute;
  right: 0;
  padding-right: var(--gutter);

  &::before {
    content: var(--l-close);
  }
}
</style>
