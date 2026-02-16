<script lang="ts" setup>
// const defaultsStore = useDefaultsStore()
// const { defaults } = storeToRefs(defaultsStore)

const navVisible = ref(true)

const toggleNavigation = () => {
  navVisible.value = !navVisible.value
}
</script>

<template>
  <header class="app-header">
    <!-- <h1>{{ defaults.appTitle }}</h1> -->
    <SiteLogo />
    <button class="button" @click="toggleNavigation">
      <span v-if="navVisible" class="close" />
      <span v-else class="open" />
    </button>
    <NavList :is-visible="navVisible" />
    <!-- <LanguageSwitch /> -->
  </header>
</template>

<style lang="scss" scoped>
.app-header {
  position: fixed;
  top: 0;
  left: 0;
  z-index: 1;
  display: flex;
  justify-content: center;
  width: 100%;
}

.button {
  @include button-reset;

  position: absolute;
  top: 0;
  right: 0;
  z-index: 3;

  // padding: var(--gutter);

  // @media (min-width: $medium) {
  //   padding: var(--gutter) calc(var(--gutter) * 2) 0 var(--gutter);
  // }
}

.open,
.close {
  // @extend %ff-sans;
  // @extend %fs-nav;

  display: inline-block;

  &::before {
    display: block;

    // width: var(--gutter);
    // height: var(--gutter);
    content: '';
  }
}

.open {
  &::before {
    content: '\2630';
  }
}

.close {
  &::before {
    content: '\00D7';
  }
}
</style>
