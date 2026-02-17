<script lang="ts" setup>
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const toggleNavigation = () => {
  layout.value.openOverlay.navigation = !layout.value.openOverlay.navigation
}
</script>

<template>
  <header ref="header" class="app-header">
    <!-- <h1>{{ defaults.appTitle }}</h1> -->
    <SiteLogo />
    <button class="button" @click="toggleNavigation">
      <span v-if="layout.openOverlay.navigation" class="close" />
      <span v-else class="open" />
    </button>
    <NavList />
    <!-- <LanguageSwitch /> -->
  </header>
</template>

<style lang="scss" scoped>
.app-header {
  position: sticky;
  top: 0;
  left: 0;
  z-index: 2; // higher than 1 due to links on home
  display: flex;
  justify-content: space-between;
  width: 100%;
  background-color: var(--white);

  @media (min-width: $medium) {
    justify-content: center;
  }
}

.button {
  @include button-reset;

  position: absolute;
  top: 0;
  right: 0;
  z-index: 3;
  padding: var(--gutter);

  @media (min-width: $medium) {
    padding: var(--gutter) calc(var(--gutter) * 2) 0 var(--gutter);
  }
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
