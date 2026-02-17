<script lang="ts" setup></script>

<template>
  <div class="layout-default">
    <AppHeader />
    <slot />
    <!-- <AppFooter /> -->
  </div>
</template>

<style lang="scss" scoped>
.layout-default {
  display: grid;
  grid-template-rows: auto minmax(0, 1fr); /* header, then main */
  height: 100%;
  min-height: 0;
}
</style>
