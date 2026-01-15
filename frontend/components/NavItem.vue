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
</script>

<template>
  <NuxtLink :to="item.meta.url" class="nav-item">{{
    props.item.meta.title
  }}</NuxtLink>

  <!-- use classic ul tag for sub-navigation to prevent recursive component issues. This happens even though I'm making sure to only fetch one level deep from the backend. Dedicated components don't work either.  -->
  <ul v-if="showChildren" class="sub-nav-list">
    <NavItem
      v-for="child in props.item.children"
      :key="child.name"
      :item="child"
    />
  </ul>
</template>

<style lang="scss" scoped>
.nav-item {
  @include link-default;
}

// .router-link-active {}
// .router-link-exact-active {}
</style>
