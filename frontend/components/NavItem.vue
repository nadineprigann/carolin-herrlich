<script lang="ts" setup>
const breakpointsStore = useBreakpointsStore()
const { isMedium } = storeToRefs(breakpointsStore)
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const emit = defineEmits(['toggle-sub-nav'])

const props = defineProps<{
  item: Routes
}>()

const hasChildren = computed(() => {
  return Object.hasOwn(props.item, 'children')
})

const showChildren = computed(() => {
  return hasChildren.value && props.item.children.length > 0
})

// evalute if item is top level. level-a and blog is only used for semantic structure for the user
const isTopLevel = computed(() => {
  return (
    props.item.meta.template === 'level-a' ||
    props.item.meta.template === 'blog'
  )
})

const classes = computed(() => {
  return {
    item: [
      isTopLevel.value ? 'nav-item' : 'sub-nav-item',
      showSubNav.value ? 'is-open' : '',
    ],
  }
})

const isCurrent = computed(() => {
  return props.item.meta.id === layout.value.currentSubNav
})

// only toggles the subnav of the item that was clicked due to putting the click event on the specific nav item
const toggleSubNav = () => {
  // do not emit on medium screens as it is shown by default
  if (isMedium.value || !showChildren.value) return
  emit('toggle-sub-nav', props.item.meta.id)
}

const showSubNav = computed(() => {
  // if we are on medium screens and the item has children, ignore current and show them all. if we're on smaller screens, only show the children of the current item. no watcher needed since computed reacts to changes in isMedium and currentSubNav
  if (isMedium.value && showChildren.value) return true
  return isCurrent.value
})

const closeNav = () => {
  layout.value.openOverlay.navigation = false
}
</script>

<template>
  <li :class="classes.item">
    <span
      v-if="isTopLevel"
      class="title"
      @click="toggleSubNav"
      v-text="props.item.meta.title"
    />
    <NuxtLink v-else :to="props.item.meta.url" class="link" @click="closeNav">
      <span class="link-title" v-text="props.item.meta.title" />
    </NuxtLink>
    <!-- use classic ul tag for sub-navigation to prevent recursive component issues. This happens even though I'm making sure to only fetch one level deep from the backend. Dedicated components don't work either.  -->
    <template v-if="showChildren">
      <ul v-show="showSubNav" class="sub-nav-list">
        <NavItem
          v-for="child in props.item.children"
          :key="`sub-${child.name}`"
          :item="child"
        />
      </ul>
    </template>
  </li>
</template>

<style lang="scss" scoped>
.nav-item {
  &:not(:last-child) {
    padding-bottom: var(--spacing-m);
  }

  @media (min-width: $tablet) {
    &:not(:last-child) {
      padding-bottom: 0;
    }
  }
}

.sub-nav-item {
  padding-left: calc(var(--gutter-base) * 4);

  &:not(:last-child) {
    padding-bottom: var(--spacing-m);
  }

  @media (min-width: $tablet) {
    padding-left: calc(var(--gutter-base) * 2);
  }
}

.link {
  @include link-default;
}

.title,
.link-title {
  @include ff-sans;
  @include fs-medium;
}

.title {
  @include toggle-icon;

  // reset mixin styles to not display toggle on larger screens
  @media (min-width: $medium) {
    cursor: default;

    &::before {
      display: none;
      content: none;
    }
  }
}

.sub-nav-list {
  @include list-reset;

  padding-top: var(--spacing-m);
}

// .router-link-active {}
// .router-link-exact-active {}
</style>
