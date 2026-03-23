<script lang="ts" setup>
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)
const { debounce } = useDebounce()

const emit = defineEmits(['header-height'])

const toggleNavigation = () => {
  layout.value.openOverlay.navigation = true
}

const showButton = computed(() => {
  return !layout.value.openOverlay.navigation
})

const headerRef = ref<HTMLElement>()

const getHeaderHeight = () => {
  if (!headerRef.value) return
  // emit to parent layout to bind to template in order to define header-height custom prop globally from one source
  emit('header-height', headerRef.value?.offsetHeight + 1)
}

const handleResize = debounce(() => {
  if (!headerRef.value) return
  getHeaderHeight()
}, 150)

onMounted(() => {
  nextTick(() => {
    getHeaderHeight()
  })
  window.addEventListener('resize', handleResize)
})

onUnmounted(() => {
  window.removeEventListener('resize', handleResize)
})
</script>

<template>
  <header ref="headerRef" class="app-header">
    <!-- <h1>{{ defaults.appTitle }}</h1> -->
    <SiteLogo />
    <button
      v-if="showButton"
      type="button"
      class="button"
      aria-label="Navigation öffnen"
      @click="toggleNavigation"
    >
      <span class="open" />
    </button>
    <NavList />
    <section class="legal">
      <ImprintOverlay />
      <PrivacyOverlay />
    </section>
    <!-- <LanguageSwitch /> -->
  </header>
</template>

<style lang="scss" scoped>
.app-header {
  position: sticky;
  top: 0;
  left: 0;
  z-index: var(--l-header); // higher than 1 due to links on home
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  padding: var(--gutter-m) var(--gutter-s);
  background-color: var(--white);

  @media (min-width: $medium) {
    justify-content: center;
    padding: var(--gutter-m);
  }
}

.button {
  @include text-hover;
  @include text-focus;

  position: absolute;
  top: 0;
  right: 0;
  z-index: var(--xxl-overlay);
  display: flex;
  padding: var(--gutter-m) var(--gutter-s) 0 var(--gutter-s);

  @media (min-width: $medium) {
    padding: var(--gutter-m) var(--gutter-m) 0 var(--gutter-m);
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
  }
}

.open {
  &::before {
    margin-top: -0.5em;
    margin-right: -0.1em;
    font-size: 1.5em;
    content: var(--nav);
  }
}

.close {
  &::before {
    margin-top: -0.3em;

    // margin-right: -0.1em;
    font-size: 1.2em;
    content: var(--l-close);
  }
}

.legal {
  margin-top: calc(var(--blank-line) * 2);
}
</style>
