<script lang="ts" setup>
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const showOverlay = computed(() => {
  return layout.value.openOverlay.success
})

const labels = reactive({
  title: 'Vielen Dank für deine Anfrage!',
  description:
    'Du hast eine Bestätigungsmail von mir bekommen und ich melde mich so schnell wie möglich bei dir zurück.',
})
</script>

<template>
  <section v-if="showOverlay" class="success-overlay">
    <FieldText element="h2" :text="labels.title" class="title" />
    <FieldTextarea element="p" :text="labels.description" class="description" />
  </section>
</template>

<style lang="scss" scoped>
.success-overlay {
  position: fixed;
  top: 0;
  left: 0;
  z-index: var(--xxl-overlay);
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  background-color: var(--white-90);
  backdrop-filter: blur(var(--bg-blur));
}

.title,
.description {
  @include center-content;

  text-align: center;
}

.title {
  @include ff-sans;
  @include fs-large;
}
</style>
