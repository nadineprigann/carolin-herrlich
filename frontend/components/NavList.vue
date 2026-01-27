<script lang="ts" setup>
const defaultsStore = useDefaultsStore()
const { defaults } = storeToRefs(defaultsStore)
</script>

<template>
  <nav class="nav">
    <ul class="nav-list">
      <NavItem
        v-for="item in defaults.navigation"
        :key="item.name"
        :item="item"
      />
    </ul>
  </nav>
</template>

<style lang="scss" scoped>
.nav-list {
  @include list-reset;
}
</style>
