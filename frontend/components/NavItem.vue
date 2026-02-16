<script lang="ts" setup>
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
const showLink = computed(() => props.item.meta.template !== 'level-a')
</script>

<template>
  <li :class="className">
    <NuxtLink v-if="showLink" :to="props.item.meta.url" class="link">
      <span class="title" v-text="props.item.meta.title" />
    </NuxtLink>
    <span v-else class="title" v-text="props.item.meta.title" />
    <!-- use classic ul tag for sub-navigation to prevent recursive component issues. This happens even though I'm making sure to only fetch one level deep from the backend. Dedicated components don't work either.  -->
    <ul v-if="showChildren" class="sub-nav-list">
      <NavItem
        v-for="child in props.item.children"
        :key="`sub-${child.name}`"
        :item="child"
      />
    </ul>
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
