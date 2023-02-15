<script lang="ts" setup>
const defaultsStore = useDefaultsStore()
const { defaults } = storeToRefs(defaultsStore)
</script>

<template>
  <div class="app-header">
    <h1>{{ defaults.appTitle }}</h1>
    <NavList />
    <!-- <LanguageSwitch /> -->
  </div>
</template>

<style lang="scss" scoped>
// .app-header {
//   h1 {}
// }
</style>
