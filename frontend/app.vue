<template>
  <div class="app">
    <NuxtPage />
  </div>
</template>

<style>
/* Page transition is set in nuxt.config.ts */
.page-enter-active,
.page-leave-active {
  transition: opacity 450ms ease;
}

.page-enter-from,
.page-leave-to {
  opacity: 0;
}
</style>

<style lang="scss">
@import '~/assets/styles/defaults';
</style>
