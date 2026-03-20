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
    <NuxtLink :to="props.item.link.meta.url" class="link">
      <FieldImage
        :image="props.item.image"
        :caption="false"
        class="image"
        :sizes="sizes"
      />
      <section class="content">
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
      </section>
    </NuxtLink>
  </div>
</template>

<style lang="scss" scoped>
.link {
  @include link-reset;
  @include focus-default($color: transparent);

  display: grid;

  // implicitly create two rows, one for the image and one for the content
  grid-template-rows: minmax(0, 1fr) auto; // content gets space as needed, image gets the rest;
  width: 100%;
  height: 100%;
  padding: 1rem var(--gutter-l) 0 var(--gutter-l); // set small padding-top to make focus visible
  overflow: hidden;
}

.slider-matrix-type-home-slide {
  height: 100%;

  :deep(img) {
    height: 100%;
    object-fit: cover;
  }

  // use explicit hover and focus style shere rather than the mixins to be able to use the pseudo-classes on image and text separately
  &:hover,
  &:focus-within {
    .image {
      cursor: pointer;
      box-shadow: var(--shadow) var(--highlight-color);
    }

    .link {
      text-shadow: var(--shadow) var(--highlight-color);
    }
  }
}

.content {
  // use min-height to avoid overly jumping of slides due to different content
  min-height: calc(var(--blank-line) * 8);
  max-height: calc(var(--blank-line) * 9);
  margin-top: var(--gutter-base);
  background-color: var(--white);

  @media (min-width: $desktop) {
    display: grid;
    grid-template-columns: 25% auto 15em;
    gap: 0 var(--gutter-l);
    min-height: calc(var(--blank-line) * 3);
    max-height: calc(
      var(--blank-line) * 3
    ); // make sure that content never exceeds constraints
  }
}

.header {
  margin-bottom: var(--blank-line);
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
  @include line-clamp(3);

  @media (min-width: $tablet) {
    max-width: 70%;
  }

  @media (min-width: $desktop) {
    max-width: none;
  }
}

.categories {
  margin-top: var(--blank-line);

  @media (min-width: $desktop) {
    place-content: start end;
    margin-top: 0;
  }
}
</style>
