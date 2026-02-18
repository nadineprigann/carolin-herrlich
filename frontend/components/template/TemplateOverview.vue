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
  items: OverviewItem[] // categories like on tools overview page
}

const props = defineProps<{
  data: TemplateOverview
}>()

const { fields, children, items, breadcrumbs } = toRefs(props.data)

const labels = reactive({
  info: 'Infos zu dieser Seite',
})

const hasChildren = computed(() => {
  return children?.value?.length > 0
})

const hasItems = computed(() => {
  return items?.value?.length > 0
})

const hasContent = computed(() => {
  return hasChildren.value || hasItems.value
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
  } else if (hasItems.value) {
    items.value.forEach((item) => images.push(item.fields.image))
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

onDeactivated(() => {
  infoVisible.value = false
})
</script>

<template>
  <main class="template-overview">
    <section class="content-section">
      <BreadcrumbList :breadcrumbs="breadcrumbs" class="breadcrumbs" />
      <FieldText element="h2" :text="fields.title" class="title" />
      <section v-if="fields.text" class="info-section">
        <FieldText
          element="h4"
          class="label"
          :text="labels.info"
          @click="toggleInfo"
        />
        <FieldTextarea v-show="infoVisible" :text="fields.text" class="text" />
      </section>
      <ImageSlider v-if="showSlider" :slides="coverImages" />

      <ul v-if="hasContent" class="overview-list">
        <!-- use children if there are any, otherwise use items (categories on tools overview page) -->
        <OverviewItem
          v-for="(child, index) in children ?? items"
          :key="`overview-item-${index}`"
          :item="child"
          :hovered-item="currentItem"
          @current-item="handleCurrentItem"
        />
      </ul>
      <!-- TODO: maybe use vue-portal to init it in the child but then render it here to prevent transition issues -->
      <template v-if="hasCoverImage">
        <transition name="t-fade">
          <div v-if="currentItem" :key="currentItem.index" class="cover">
            <FieldImage
              :image="currentItem.fields?.image"
              :show-caption="false"
            />
          </div>
        </transition>
      </template>
    </section>
    <RelatedContent :related="fields.related_content" class="related" />
  </main>
</template>

<style lang="scss">
// defined in _transitions.scss, variables in _variables.scss
@include t-fade($duration: var(--xshort));
</style>

<style lang="scss" scoped>
.template-overview {
  display: grid;

  // keep myzel height the same as the subtraction value for the cover image in OverviewItem.vue
  grid-template-rows: 1fr 3em; // content, then myzel section. fixed height leads to problems when myzel is not there. see RelatedContent.vue but makes it possible to overflow to the bottom when myzel accordions are toggled.
  min-height: 0; // this makes sure the content can shrink if needed, preventing overflow when there are no slides
  // overflow: hidden;
}

.content-section {
  position: relative;

  // grid-template-rows: auto auto auto minmax(0, 1fr) auto; // give all elements the space they need and let slider take the remaining space. OR categories under it. but for now: no grid on mobile to stack all according to its space.
  height: 100%;

  @media (min-width: $medium) {
    display: grid;
    grid-template-rows: auto auto minmax(0, 1fr) auto; // give all elements the space they need and let the info section take the remaining space
  }
}

.info-section {
  position: relative;
  z-index: var(
    --xs-dropdown
  ); // above slider on mobile, but below content on desktop

  background-color: var(--white);
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

  @media (min-width: $medium) {
    grid-template-columns: repeat(3, 1fr);
    grid-row: 4; // make sure to always set to last row to prevent layout breaking when info-section is empty and therefore not rendered
  }
}

.cover {
  display: none;

  // border-top-left-radius: var(--border-radius-small);
  // border-top-right-radius: var(--border-radius-small);
  overflow: hidden;

  @media (min-width: $medium) {
    position: absolute;
    inset: 0; // shorthand for top: 0; left: 0; right: 0; bottom: 0;
    z-index: var(
      --s-cover-image
    ); // cover over info section but under other content like breadcrumbs and title

    display: block;
    width: 100vw;
    height: 100%;

    // height: calc(
    //   100vh - 3em
    // ); // TODO: maybe fetch grid row height of parent dynamically and store in CSS var to subtract it from 100vh here -> prevents to overlap myzel-section. but: auto does not create overflow to the bottom when toggling the sections, it rather extends the row to the top. thus hard-coded for now. Keep in sync with grid row height in TemplateOverview.vue

    pointer-events: none;

    img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
  }
}
</style>
