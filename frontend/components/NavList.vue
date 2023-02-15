<script lang="ts" setup>
const defaultsStore = useDefaultsStore()
const { defaults } = storeToRefs(defaultsStore)
</script>

<template>
  <nav class="nav-list">
    <NavItem
      v-for="item in defaults.navigation"
      :key="item.name"
      :item="item"
    />
  </nav>
</template>

<style lang="scss" scoped>
// .nav-list {}
</style>
