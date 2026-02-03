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
    <button class="button" @click="closeNote">x</button>
  </section>
</template>

<style lang="scss" scoped>
// .note {}
</style>
