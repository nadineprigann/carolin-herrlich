<script lang="ts" setup>
const defaultsStore = useDefaultsStore()
const { defaults } = storeToRefs(defaultsStore)
</script>

<template>
  <div class="language-switch">
    <LanguageButton
      v-for="(language, index) in defaults.availableLanguages"
      :key="`language-${index}`"
      :language="language"
    />
  </div>
</template>

<style lang="scss" scoped>
// .language-switch {}
</style>
