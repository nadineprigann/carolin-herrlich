<script lang="ts" setup>
const props = defineProps<{
  item: MatrixTypeHomeSlide
}>()

const showCategories = computed(() => {
  return props.item.categories.length > 0
})
</script>

<template>
  <div v-if="props.item.title" class="slider-matrix-type-home-slide">
    <FieldImage :image="props.item.image" :show-caption="false" class="image" />
    <section class="content">
      <NuxtLink :to="props.item.link.meta.url" class="link">
        <section class="header">
          <div class="title" v-text="props.item.title" />
          <div v-if="props.item.date_start" class="dates">
            <span class="date-start" v-text="props.item.date_start" />
            <span
              v-if="props.item.date_end"
              class="date-end"
              v-text="props.item.date_end"
            />
          </div>
        </section>
        <FieldTextarea v-if="props.item.text" :text="props.item.text" />
      </NuxtLink>
      <CategoryList v-if="showCategories" :categories="props.item.categories" />
    </section>
  </div>
</template>

<style lang="scss" scoped>
.slider-matrix-type-home-slide {
  display: grid;

  // implicitly create two rows, one for the image and one for the content
  grid-template-rows: minmax(0, 1fr) auto; // content gets space as needed, image gets the rest;
  height: 100%;
  overflow: hidden;

  :deep(img) {
    height: 100%;
    object-fit: cover;
  }
}

.header {
  @media (min-width: $medium) {
    display: flex;
    flex-wrap: wrap; // allow wrapping to multiple lines if needed
    justify-content: space-between;
  }
}

.date-end {
  &::before {
    content: ' – ';
  }
}
</style>
