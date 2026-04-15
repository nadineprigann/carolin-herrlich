<script lang="ts" setup>
const breakpointsStore = useBreakpointsStore()
const { isMedium } = storeToRefs(breakpointsStore)

interface TemplateOverview extends Page {
  fields: {
    meta_description: string
    text: string
    related_content: RelatedContent
  }
  children: OverviewItem[] // child pages like on grundlagen overview page etc.
  categories: Category[] // categories like on tools overview page
}

const props = defineProps<{
  data: TemplateOverview
}>()

const { fields, children, categories, breadcrumbs } = toRefs(props.data)

const labels = reactive({
  info: 'Infos zu dieser Seite',
  all: 'Alle',
})

const classes = computed(() => {
  return {
    info: ['info-section', infoVisible.value ? 'is-open' : ''],
  }
})

const hasChildren = computed(() => {
  return children?.value?.length > 0
})

const hasCategories = computed(() => {
  return categories?.value?.length > 0
})

const hasContent = computed(() => {
  return hasChildren.value || hasCategories.value
})

const infoVisible = ref(false)
const currentItem = ref<OverviewItem | null>(null)

function toggleInfo() {
  infoVisible.value = !infoVisible.value
}

// account for children from regular overview pages AND for items (categories) from overview-tools page
const coverImages = computed(() => {
  const images = []
  if (hasChildren.value) {
    children.value.forEach((child) => images.push(child.fields.image))
  } else if (hasCategories.value) {
    categories.value.forEach((category) => images.push(category.fields.image))
  } else return []
  return images
})

const showSlider = computed(() => {
  return coverImages.value.length > 0 && !isMedium.value
})

const hasCoverImage = computed(() => {
  return currentItem.value?.fields?.image
})

const handleCurrentItem = (item: OverviewItem | null) => {
  currentItem.value = item
}

const linkToAll = computed(() => {
  return props.data.meta.url + 'werkzeuge/'
})

const sizes = computed(() => {
  return '(min-width: 80em) 100vw, (min-width: 48em) 100vw, 100vw'
})

onDeactivated(() => {
  infoVisible.value = false
})
</script>

<template>
  <main class="template-overview">
    <section class="content-section">
      <BreadcrumbList :breadcrumbs="breadcrumbs" class="breadcrumbs" />
      <FieldText element="h2" :text="fields.title" class="title" />
      <section v-if="fields.text" :class="classes.info">
        <button type="button" class="header" @click="toggleInfo">
          <FieldText element="h3" class="label" :text="labels.info" />
        </button>
        <FieldTextarea v-show="infoVisible" :text="fields.text" class="text" />
      </section>
      <ImageSlider
        v-if="showSlider"
        :slides="coverImages"
        :mode="'overview'"
        :caption="false"
        :autoplay="true"
        :controls="false"
      />

      <ul v-if="hasContent" class="overview-list">
        <!-- use children if there are any, otherwise use categories (categories on tools overview page). for now, without filter implemented, do not show overview items on tools -->
        <OverviewItem
          v-for="(child, index) in children ?? categories"
          :key="`overview-item-${index}`"
          :item="child"
          @current-item="handleCurrentItem"
        />
        <!-- <NuxtLink v-if="hasCategories" :to="linkToAll" class="link">
          <FieldText element="h4" class="link-title" :text="labels.all" />
        </NuxtLink> -->
      </ul>
    </section>
    <!-- note: make sure to not use a conditionally rendered wrapper as it blocks transition detection and breaks them. -->
    <transition name="t-cover">
      <div v-if="currentItem" class="cover">
        <div class="tint" />
        <FieldImage
          :image="currentItem.fields?.image"
          :caption="false"
          :sizes="sizes"
        />
      </div>
    </transition>
    <RelatedContent :related="fields.related_content" class="related" />
  </main>
</template>

<style lang="scss">
// defined in _transitions.scss, variables in _variables.scss
@include t-cover;
</style>

<style lang="scss" scoped>
.template-overview {
  display: grid;

  // keep myzel height the same as the subtraction value for the cover image in OverviewItem.vue

  grid-template-rows: min-content; // make sure that all items follow suit like auto to avoid toggling the accordion upwards. right now: normal page flow.
  gap: calc(var(--gutter-base) * 6) 0;
  height: calc(
    100vh - var(--header-height)
  ); // full viewport height minus header, set via default.vue and AppHeader.vue communication

  // overflow: hidden;
  min-height: 0; // this makes sure the content can shrink if needed, preventing overflow when there are no slides
  padding: var(--page-spacing);

  @media (min-width: $medium) {
    grid-template-rows:
      minmax(calc(100% - calc(var(--blank-line) * 4.7)), 1fr)
      auto;
    grid-template-columns: minmax(0, 1fr) var(--content-width) minmax(0, 1fr); // minmax to prevent overflow of cover bc it basically says removes the implicit minimum width of 1fr which makes the image "obey"
    gap: var(--gutter-s) 0;
    padding: 0; // reset padding on larger screens to avoid cover image to overflow -> padding applies to it since its not absolutely positioned
  }

  @media (min-width: $desktop) {
    grid-template-rows:
      minmax(calc(100% - calc(var(--blank-line) * 4.5)), 1fr)
      auto;
  }
}

.content-section {
  position: relative;
  display: grid;
  grid-template-rows: repeat(5, auto);
  align-self: start;

  // height: 100%;

  @media (min-width: $medium) {
    grid-template-rows: auto auto minmax(0, 1fr) auto; // give all elements the space they need and let the info section take the remaining space
    grid-row: 1 / 2;
    grid-column: 2 / 3;
    align-self: stretch; // make sure content takes full height on large screens

    // width: var(--content-width);
  }
}

.info-section {
  position: relative;
  z-index: var(
    --xs-dropdown
  ); // above slider on mobile, but below content on desktop

  background-color: var(--white);

  @media (min-width: $medium) {
    background-color: transparent;
  }
}

.text {
  position: absolute;
  width: 100%;
  height: 30vh; // keep in sync with slider height in ImageSlider.vue to cover slider while reading
  background-color: var(--white);

  @media (min-width: $medium) {
    // reset stuff on desktop
    position: static;
    height: auto;
    background-color: none;
  }
}

.breadcrumbs,
.title,
.overview-list,
.related {
  position: relative;
  z-index: var(--m-upper-content); // above all content, also cover image
}

.overview-list {
  @include list-reset;

  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: var(--gutter-base);

  @media (min-width: $medium) {
    grid-template-columns: repeat(3, 1fr);
    grid-row: 4; // make sure to always set to last row to prevent layout breaking when info-section is empty and therefore not rendered
    gap: var(--gutter-s);
    margin-bottom: var(--gutter-s);
  }
}

.cover {
  display: none;

  // border-top-left-radius: var(--border-radius-small);
  // border-top-right-radius: var(--border-radius-small);
  overflow: hidden;

  @media (min-width: $tablet) {
    position: relative;
    z-index: var(
      --s-cover-image
    ); // cover over info section but under other content like breadcrumbs and title. works without position due to grid

    display: block;
    grid-row: 1 / 2;
    grid-column: 1 / 3;
    width: 100vw;
    height: 100%;
    pointer-events: none;

    :deep(img) {
      height: 100%;
      object-fit: cover;
    }
  }
}

.tint {
  @media (min-width: $tablet) {
    position: absolute;
    z-index: 250; // in between 200 for cover image and 300 for content above cover image
    width: 100%;
    height: 100%;
    background-color: var(--white-40);
  }
}

.header {
  @include toggle-icon;
  @include text-focus;
  @include text-hover;

  width: 100%;
  padding-bottom: var(--accordion-title-spacing);
  margin-bottom: var(--gutter-s);
  border-bottom: 1px dashed var(--black);
}

.link {
  @include link-reset;
  @include highlight-element;
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
  height: 100%;
  min-height: calc(var(--blank-line) * 3.5);

  @media (min-width: $medium) {
    min-height: calc(var(--blank-line) * 3);
  }
}

.title,
.label,
.link-title {
  @include ff-sans;
}

.title {
  @include fs-xlarge;

  margin-bottom: var(--gutter-xl);

  @media (min-width: $medium) {
    margin-bottom: calc(var(--gutter-base) * 5);
  }
}

.link-title {
  @include fs-medium;
}
</style>
