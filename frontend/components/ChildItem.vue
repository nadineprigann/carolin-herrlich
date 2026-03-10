<script lang="ts" setup>
import { useRoute } from 'vue-router'
const route = useRoute()

const props = defineProps<{
  child: childItem
}>()

// TODO: fix computed property to return boolean
const showChild = computed(() => {
  return props.child?.fields && props.child?.meta
})

const isEvent = computed(() => {
  return props.child?.meta.template === 'event'
})

const showDescription = computed(() => {
  return isEvent.value && props.child?.fields.long_description.length > 0
})

// save current list filters in navigation state when linking to detail page
const linkTo = computed(() => {
  return {
    path: props.child.meta.url,
    state: { listFilters: { ...route.query } },
  }
})
</script>

<template>
  <li class="child-item">
    <NuxtLink v-if="showChild" :to="linkTo" class="link">
      <div class="header">
        <FieldText
          v-if="isEvent"
          element="h5"
          class="subtitle"
          :text="props.child.fields.subtitle"
        />
        <FieldText
          element="h5"
          class="title"
          :text="props.child.fields.title"
        />
      </div>
      <FieldTextarea
        v-if="showDescription"
        class="description"
        :text="props.child.fields.long_description"
      />
      <CategoryList :categories="props.child.fields.select_category" />
    </NuxtLink>
  </li>
</template>

<style lang="scss" scoped>
.child-item {
  padding: 0.5rem 0 var(--gutter-base) 0;
  border-bottom: 0.5px dashed var(--black);

  @media (min-width: $tablet) {
    padding: var(--gutter-s) 0 var(--gutter-m) 0;
  }
}

.link {
  @include link-reset;
}

.title,
.subtitle {
  @include ff-sans;
  @include fs-medium;
}

.subtitle {
  margin-bottom: var(--spacing-xxs);
}

.description {
  display: -webkit-box; // clamp text after 3 lines and add an ellipsis, doesn't work if eleemnt itself is display: flex
  min-width: 0;
  margin-top: var(--gutter-s);

  // clamp text after 3 lines and add an ellipsis
  overflow: hidden;
  hyphens: auto;
  word-break: break-word;
  -webkit-line-clamp: var(--line-clamp);
  -webkit-box-orient: vertical;
  line-clamp: var(
    --line-clamp
  ); // used by browsers who know this, others use upper declarations
}
</style>
