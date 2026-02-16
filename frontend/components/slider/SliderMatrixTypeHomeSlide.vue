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
        <div class="title" v-text="props.item.title" />
        <div v-if="props.item.date_start" class="dates">
          <span v-text="props.item.date_start" />
          <span v-if="props.item.date_end" v-text="props.item.date_end" />
        </div>
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
  // grid-template-rows: auto auto; // content gets space as needed, image gets the rest;
  height: 100%;
  overflow: hidden;
}

.image {
  min-height: 0; // allow image to shrink within the grid

  /* FieldImage renders <figure class="field-image"> */
  // :deep(.field-image) {
  //   display: grid;
  //   grid-template-rows: minmax(0, 1fr) auto; /* img gets space, caption only as-needed */
  //   min-height: 0;
  //   overflow: hidden;
  // }

  // /* The actual <img class="image"> inside FieldImage */
  // :deep(img.image) {
  //   display: block;
  //   width: 100%;
  //   height: 100%;
  //   min-height: 0;
  //   object-fit: contain;
  // }

  // &.isPortrait {
  //   height: 100%;s
  //   margin: 0 auto;

  //   img {
  //     width: auto;
  //     height: 100%;
  //   }
  // }
}
</style>
