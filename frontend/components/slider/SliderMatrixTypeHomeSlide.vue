<script lang="ts" setup>
const props = defineProps<{
  item: MatrixTypeHomeSlide
}>()

const showCategories = computed(() => {
  return props.item.categories.length > 0
})

const sizes = computed(() => {
  return '(min-width: 80em) 65vw, (min-width: 48em) 45vw, 78vw'
})
</script>

<template>
  <div v-if="props.item.title" class="slider-matrix-type-home-slide">
    <FieldImage
      :image="props.item.image"
      :caption="false"
      class="image"
      :sizes="sizes"
    />
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
        <FieldTextarea
          v-if="props.item.text"
          :text="props.item.text"
          class="text"
        />
        <CategoryList
          v-if="showCategories"
          :categories="props.item.categories"
          class="categories"
        />
      </NuxtLink>
    </section>
  </div>
</template>

<style lang="scss" scoped>
.slider-matrix-type-home-slide {
  display: grid;

  // implicitly create two rows, one for the image and one for the content
  grid-template-rows: minmax(0, 1fr) auto; // content gets space as needed, image gets the rest;
  height: 100%;
  padding: 1rem var(--gutter-l) 0 var(--gutter-l); // set small padding-top to make focus visible
  overflow: hidden;

  :deep(img) {
    height: 100%;
    object-fit: cover;
  }

  // use explicit hover and focus style shere rather than the mixins to be able to use the pseudo-classes on image and text separately
  &:hover,
  &:focus-within {
    .image {
      box-shadow: var(--shadow) var(--highlight-color);
    }

    .link {
      text-shadow: var(--shadow) var(--highlight-color);
    }
  }
}

.content {
  // use min-height to avoid overly jumping of slides due to different content
  min-height: calc(var(--blank-line) * 10);
  margin-top: var(--gutter-base);

  @media (min-width: $tablet) {
    min-height: calc(var(--blank-line) * 9);
  }
}

.link {
  @include link-reset;
  @include focus-default($color: transparent);

  display: block;
  width: 100%;
}

.header {
  margin-bottom: var(--blank-line);

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

.title,
.date-start,
.date-end,
.text {
  @include ff-sans;
}

.title {
  padding-right: var(--gutter-m);
}

.text {
  @include line-clamp;

  @media (min-width: $desktop) {
    max-width: 85%;
  }
}

.categories {
  margin-top: var(--blank-line);
}
</style>
