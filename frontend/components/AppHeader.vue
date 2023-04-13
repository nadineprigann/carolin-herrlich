<script lang="ts" setup>
const defaultsStore = useDefaultsStore()
const { defaults } = storeToRefs(defaultsStore)
</script>

<template>
  <header class="app-header">
    <h1>{{ defaults.appTitle }}</h1>
    <NavList />
    <!-- <LanguageSwitch /> -->
  </header>
</template>

<style lang="scss" scoped>
// .app-header {
//   h1 {}
// }
</style>
