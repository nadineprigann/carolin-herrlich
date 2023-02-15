<script lang="ts" setup>
const props = defineProps({
  item: { type: Object, required: true },
})
</script>

<template>
  <NuxtLink :to="item.meta.url" class="nav-item">{{
    props.item.meta.title
  }}</NuxtLink>
</template>

<style lang="scss" scoped>
.nav-item {
  @include link-default;
}

// .router-link-active {}
// .router-link-exact-active {}
</style>
