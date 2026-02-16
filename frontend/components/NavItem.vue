<script lang="ts" setup>
const breakpointsStore = useBreakpointsStore()
const { isLarge } = storeToRefs(breakpointsStore)

const props = defineProps<{
  item: Route
}>()

const hasChildren = computed(() => {
  return Object.hasOwn(props.item, 'children')
})

const showChildren = computed(() => {
  return hasChildren.value && props.item.children.length > 0
})

const className = computed(() => {
  return props.item.meta.template === 'level-a' ? 'nav-item' : 'sub-nav-item'
})

// only render link for non-level-a items. level-a is only used for semantic structure for the user
const isLevelA = computed(() => props.item.meta.template === 'level-a')

const isSubNavVisible = ref(false)

const handleSubNavVisibility = () => {
  isLarge.value
    ? (isSubNavVisible.value = true)
    : (isSubNavVisible.value = false)
}

// only toggles the subnav of the item that was clicked due to putting the click event on the specific nav item
const toggleSubNav = () => {
  // do not toggle on large screens as it is shown by default
  if (isLarge.value || !showChildren.value) return
  isSubNavVisible.value = !isSubNavVisible.value
}

watch(
  isLarge,
  (newValue) => {
    // note: newValue is necessary to be able to pass the updated value of isLarge to other refs
    isSubNavVisible.value = newValue
  },
  { immediate: true }, // make sure it updates right when component initializes, not only on breakpoint change
)
</script>

<template>
  <li :class="className" @click="toggleSubNav">
    <span v-if="isLevelA" class="title" v-text="props.item.meta.title" />
    <NuxtLink v-else :to="props.item.meta.url" class="link">
      <span class="title" v-text="props.item.meta.title" />
    </NuxtLink>
    <!-- use classic ul tag for sub-navigation to prevent recursive component issues. This happens even though I'm making sure to only fetch one level deep from the backend. Dedicated components don't work either.  -->
    <template v-if="showChildren">
      <ul v-show="isSubNavVisible" class="sub-nav-list">
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
