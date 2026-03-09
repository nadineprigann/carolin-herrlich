<script lang="ts" setup>
const props = defineProps<{
  item: PageReference
}>()

const showItem = computed(() => {
  return props.item?.fields && props.item?.meta
})
</script>

<template>
  <li v-if="showItem" class="in-depth-item">
    <NuxtLink :to="props.item.meta.url" class="link">
      <FieldText element="h5" class="title" :text="props.item.fields.title" />
    </NuxtLink>
  </li>
</template>

<style lang="scss" scoped>
.in-depth-item {
  @include highlight-element;
  @include button-padding(
    $top: var(--gutter-base),
    $bottom: var(--gutter-base),
    $left: var(--gutter-base),
    $right: var(--gutter-base)
  );

  min-height: calc(var(--blank-line) * 3);

  &:not(:last-of-type) {
    margin-bottom: var(--gutter-base);
  }
}

.title {
  @include ff-sans;

  // font-size set via defaults h5 = 1em;
}
</style>
