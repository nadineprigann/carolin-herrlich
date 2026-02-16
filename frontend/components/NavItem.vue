<script lang="ts" setup>
const breakpointsStore = useBreakpointsStore()
const { isLarge } = storeToRefs(breakpointsStore)
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const emit = defineEmits(['toggle-sub-nav'])

const props = defineProps<{
  item: Routes
  currentSubNav: number | null
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

const className = computed(() => {
  return isTopLevel.value ? 'nav-item' : 'sub-nav-item'
})

const isCurrent = computed(() => {
  return props.item.meta.id === props.currentSubNav
})

// only toggles the subnav of the item that was clicked due to putting the click event on the specific nav item
const toggleSubNav = () => {
  // do not emit on large screens as it is shown by default
  if (isLarge.value || !showChildren.value) return
  emit('toggle-sub-nav', props.item.meta.id)
}

const showSubNav = computed(() => {
  // if we are on large screens and the item has children, ignore current and show them all. if we're on smaller screens, only show the children of the current item. no watcher needed since computed reacts to changes in isLarge and currentSubNav
  if (isLarge.value && showChildren.value) return true
  return isCurrent.value
})

const closeNav = () => {
  layout.value.openOverlay.navigation = false
}
</script>

<template>
  <li :class="className">
    <span
      v-if="isTopLevel"
      class="title"
      @click="toggleSubNav"
      v-text="props.item.meta.title"
    />
    <NuxtLink v-else :to="props.item.meta.url" class="link" @click="closeNav">
      <span class="title" v-text="props.item.meta.title" />
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
// .nav-item {}

.link {
  @include link-default;
}

.sub-nav-list {
  @include list-reset;
}

// .router-link-active {}
// .router-link-exact-active {}
</style>
