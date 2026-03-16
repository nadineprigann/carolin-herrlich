<script lang="ts" setup>
const props = defineProps<{
  category: PageReference
}>()
</script>

<template>
  <li class="category-item">
    <button type="button" class="button" disabled>
      <FieldText
        element="h5"
        class="title"
        :text="props.category.fields.title"
      />
    </button>
  </li>
</template>

<style lang="scss" scoped>
.category-item {
  @include button-default;

  &:not(:last-of-type) {
    margin-right: var(--gutter-base);
  }

  @media (min-width: $tablet) {
    &:not(:last-of-type) {
      margin-right: var(--gutter-m);
    }
  }
}

.title {
  @include ff-sans;
  @include fs-small;
}
</style>
