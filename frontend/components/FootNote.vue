<script lang="ts" setup>
const props = defineProps<{
  note: Note
}>()
</script>

<template>
  <section class="note-section">
    <div class="wrapper">
      <div class="note">
        <span class="caption" v-text="props.note.number" />
        <span class="text" v-html="props.note.text" />
      </div>
      <!-- <button
      type="button"

    /> -->
      <CloseButton
        class="button"
        aria-label="Fußnote schließen"
        @click="closeNote"
      />
    </div>
  </section>
</template>

<style lang="scss" scoped>
.note-section {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  min-height: calc(var(--blank-line) * 4);
  padding: var(--gutter-s);
  background-color: var(--grey);
  border-top: 0.5px solid var(--yellow);

  @media (min-width: $medium) {
    min-height: calc(var(--blank-line) * 3);
  }
}

.wrapper {
  position: relative;
  display: flex;
}

.note {
  @include center-content;

  display: grid;
  grid-template-columns: 3em 1fr;
  padding-right: 4em; /* add some space for the close button */
}

.button {
  @include button-padding($top: 0, $bottom: 0, $left: 0, $right: 0);

  position: absolute;
  right: 0;

  @media (min-width: $tablet) {
    @include button-padding($top: 0, $bottom: 0, $left: 0, $right: 0);
  }

  &::before {
    content: var(--l-close);
  }
}
</style>
