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

// note: not necessary to import htmlLock since this overlay can only be open ocne the CheckOutOverlay is open and thus, htmlLock is already active when that overlay is open.
</script>

<template>
  <section v-if="showOverlay" class="success-overlay">
    <div class="content">
      <FieldText element="h2" :text="labels.title" class="title" />
      <FieldTextarea
        element="p"
        :text="labels.description"
        class="description"
      />
    </div>
  </section>
</template>

<style lang="scss" scoped>
.success-overlay {
  position: fixed;
  top: 0;
  left: 0;
  z-index: var(--xxl-overlay);
  display: flex;
  flex-direction: column;

  // justify-content: center;
  width: 100vw;
  height: 100vh;
  padding: var(--gutter-m) var(--gutter-s);
  overflow: hidden;
  background-color: var(--white-90);
  backdrop-filter: blur(var(--bg-blur));

  @media (min-width: $medium) {
    padding: var(--gutter-m);
  }
}

.content {
  @include center-content;

  display: flex;
  flex-direction: column;
  align-items: center;
  padding-top: 20vh;
}

.title,
.description {
  max-width: var(--title-width);
  text-align: center;
}

.title {
  @include fs-xlarge;
  @include ff-sans;

  margin-bottom: var(--gutter-xl);

  @media (min-width: $tablet) {
    margin-bottom: calc(var(--gutter-base) * 5);
  }
}
</style>
