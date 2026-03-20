<script lang="ts" setup>
const props = defineProps<{
  link: {
    title?: string
    select_page: PageReference
    select_host?: PageReference
  }
}>()

const showLink = computed(() => {
  return Object.keys(props.link).length > 0
})
</script>

<template>
  <NuxtLink v-if="showLink" :to="link.select_page.meta.url" class="field-link">
    <FieldText v-if="link.title" :text="link.title" class="title" />
    <FieldText v-else :text="link.select_page.fields.title" class="title" />
  </NuxtLink>
</template>

<style lang="scss" scoped>
.field-link {
  @include link-reset;
  @include hover-default;
  @include focus-default;
  @include highlight-element($radius: 1em);
  @include button-padding(
    $top: var(--spacing-xxs),
    $right: var(--spacing-s),
    $bottom: 0.35em,
    $left: var(--spacing-s)
  );

  display: inline-block;

  &:not(:last-child) {
    margin-bottom: var(--gutter-base);
  }

  @media (min-width: $tablet) {
    &:not(:last-child) {
      margin-bottom: var(--gutter-s);
    }
  }
}

.title {
  @include ff-sans;
}
</style>
