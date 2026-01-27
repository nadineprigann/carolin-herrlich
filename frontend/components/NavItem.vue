<script lang="ts" setup>
const props = defineProps<{
  item: Route
  flag?: string
}>()

const hasChildren = computed(() => {
  return Object.hasOwn(props.item, 'children')
})

const showChildren = computed(() => {
  return hasChildren.value && props.item.children.length > 0
})

const className = computed(() => {
  return props.flag === 'sub' ? 'sub-nav-item' : 'nav-item'
})
</script>

<template>
  <li :class="className">
    <NuxtLink :to="item.meta.url" class="link">{{
      props.item.meta.title
    }}</NuxtLink>

    <!-- use classic ul tag for sub-navigation to prevent recursive component issues. This happens even though I'm making sure to only fetch one level deep from the backend. Dedicated components don't work either.  -->
    <ul v-if="showChildren" class="sub-nav-list">
      <NavItem
        v-for="child in props.item.children"
        :key="`sub-${child.name}`"
        :item="child"
        :flag="'sub'"
      />
    </ul>
  </li>
</template>

<style lang="scss" scoped>
.nav-item {
  @include link-default;
}

.sub-nav-list {
  @include list-reset;
}

// .router-link-active {}
// .router-link-exact-active {}
</style>
