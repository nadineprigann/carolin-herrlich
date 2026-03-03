<script lang="ts" setup>
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const labels = reactive({
  imprint: 'Impressum',
  privacy: 'Datenschutz',
})

const openImprintOverlay = () => {
  layout.value.openOverlay.imprint = true
}

const openPrivacyOverlay = () => {
  layout.value.openOverlay.privacy = true
}
</script>

<template>
  <footer class="app-footer">
    <button type="button" class="button">
      <FieldText
        element="span"
        class="label"
        :text="labels.imprint"
        aria-label="Impressum"
        @click="openImprintOverlay"
      />
    </button>
    <button type="button" class="button">
      <FieldText
        element="span"
        class="label"
        :text="labels.privacy"
        aria-label="Datenschutz"
        @click="openPrivacyOverlay"
      />
    </button>
    <ImprintOverlay />
    <PrivacyOverlay />
  </footer>
</template>

<style lang="scss" scoped>
.app-footer {
  position: relative;
  display: flex;
  justify-content: space-between;
}

.button {
  @include button-reset;
}

.label {
  @include ff-sans;
  @include fs-small;
}
</style>
