<script lang="ts" setup>
const props = defineProps<{
  child: ProjectItem
}>()

// TODO: fix computed property to return boolean
const showChild = computed(() => {
  return props.child?.fields && props.child?.meta
})
</script>

<template>
  <li v-if="showChild" class="project-item">
    <NuxtLink :to="props.child.meta.url" class="link">
      <div class="content">
        <FieldImage
          v-if="props.child?.fields.image"
          :image="props.child.fields.image"
          class="image"
          :show-caption="false"
        />
        <FieldText
          class="title"
          element="h4"
          :text="props.child.fields.title"
        />
      </div>
    </NuxtLink>
  </li>
</template>

<style lang="scss" scoped>
.project-item {
  // @include link-default;
  display: flex;
  height: 30vh;

  // TODO: how to set this within field img OR how to control overrides better? on screens above mobile, all images should be cover, is-portrait as well
  :deep(img) {
    max-width: 100%;
    height: 100%;
    object-fit: cover;
  }

  :deep(.is-portrait img) {
    object-fit: contain;
  }

  @media (min-width: $mobile) {
    margin: 0 auto; // centers the item if it has less width than the container, e.g. on mobile

    /* portrait class is on the FIGURE, not on the IMG */
    :deep(.is-portrait img) {
      object-fit: cover;
    }
  }
}

.link {
  @include link-default;

  display: block;
  width: 100%;
  height: 100%;
}

.content {
  display: grid;
  grid-template-rows: 1fr auto;
  height: 100%;
}

.title {
  justify-self: center;

  @media (min-width: $mobile) {
    justify-self: normal;
  }
}
</style>
