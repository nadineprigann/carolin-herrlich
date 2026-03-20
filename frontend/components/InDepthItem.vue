<script lang="ts" setup>
const props = defineProps<{
  item: InDepthItem
}>()

const showItem = computed(() => {
  return props.item?.select_page?.fields && props.item?.select_page?.meta
})
</script>

<template>
  <li v-if="showItem" class="in-depth-item">
    <NuxtLink :to="props.item.select_page.meta.url" class="link">
      <FieldText
        element="h5"
        class="title"
        :text="props.item.select_page.fields.title"
      />
    </NuxtLink>
  </li>
</template>

<style lang="scss" scoped>
.in-depth-item {
  @include highlight-element;

  &:not(:last-of-type) {
    margin-bottom: var(--gutter-base);
  }
}

.link {
  @include link-reset;
  @include hover-default;
  @include focus-default;
  @include button-padding(
    $top: var(--gutter-base),
    $bottom: var(--gutter-base),
    $left: var(--gutter-base),
    $right: var(--gutter-base)
  );

  display: inline-block;
  width: 100%;
  min-height: calc(var(--blank-line) * 3);
}

.title {
  @include ff-sans;

  // font-size set via defaults h5 = 1em;
}
</style>
