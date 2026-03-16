<script lang="ts" setup>
import { useRoute } from 'vue-router'
const breakpointsStore = useBreakpointsStore()
const { isMedium } = storeToRefs(breakpointsStore)
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const route = useRoute()

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
    link: ['link', isActiveParent.value ? 'is-active' : ''],
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

// use custom logic to determine active parent items, since the default router-link-active class doesn't work well with nested navigation and dynamic routes. this way we can also make sure that parent items of dynamic routes like /category/werkzeuge/ are highlighted when on a subpage like /category/werkzeuge/some-tool/
const itemPath = computed(() => {
  const url = props.item.meta.url

  if (!url) return null
  // normalize path of url by removing the trailing slash for better comparison, but keep it for root path
  // case a: string
  if (typeof url === 'string') {
    return url.replace(/\/$/, '') || '/'
  }

  // case b: object with path property
  if (
    typeof url === 'object' &&
    'path' in url &&
    typeof url.path === 'string'
  ) {
    return url.path.replace(/\/$/, '') || '/'
  }
  return null
})

const isActiveParent = computed(() => {
  // for styling: if it's a top level item or doesn't have a valid path, it can't be an active parent
  if (isTopLevel.value || !itemPath.value) return false
  // normalize the current route, too to make comparing possible
  const currentPath = route.path.replace(/\/$/, '') || '/'
  return (
    // if items match exactly
    currentPath === itemPath.value ||
    // or if the current path starts with the item path + a slash, to prevent false positives for similar paths like /about and /about-us
    currentPath.startsWith(itemPath.value + '/')
  )
})
</script>

<template>
  <li :class="classes.item">
    <span
      v-if="isTopLevel"
      class="title"
      @click="toggleSubNav"
      v-text="props.item.meta.title"
    />
    <NuxtLink
      v-else
      :to="props.item.meta.url"
      :class="classes.link"
      @click="closeNav"
    >
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
    max-width: 100%;
    padding-right: var(--gutter-s);

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

.title,
.link-title {
  @include ff-sans;
  @include fs-medium;
}

.link {
  @include link-reset;
  @include text-focus;
  @include text-hover;

  position: relative;

  &.is-active {
    &::before {
      position: absolute;
      display: inline;

      //margin-top: 0.1em; // to vertically center the bullet with the text, since the bullet is set to 1em, which is the line height of the text. adjust as needed for different font sizes or if line height changes
      margin-left: calc(var(--spacing-s) * -1);
      text-shadow: var(--shadow) var(--highlight-color);
      content: '\2022';
    }
  }
}

.title {
  @include toggle-icon;

  word-break: break-word;
  white-space: wrap;

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
