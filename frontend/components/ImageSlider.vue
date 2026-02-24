<script lang="ts" setup>
interface Props {
  slides: Image[]
  mode?: 'content' | 'overview' | 'default' | 'project'
  showCaption?: boolean
  autoplay: boolean
}

const props = withDefaults(defineProps<Props>(), {
  autoplay: false,
  showCaption: true,
  mode: 'default',
})

const currentSlide = ref(0)
let interval: number | undefined
const delay = 5000
const firstSlide = computed(() => props.slides?.[0])
const slideCount = computed(() => props.slides?.length)
const lastSlide = computed(() => currentSlide.value === slideCount.value - 1)
const isOverview = computed(() => props.mode === 'overview')
const isContent = computed(() => props.mode === 'content')
const isProject = computed(() => props.mode === 'project')

// const modeClass = computed(() => {
//   return {
//     'is-content': props.mode === 'content',
//     'is-overview': props.mode === 'overview',
//     'is-project': props.mode === 'project',
//   }
// })

const classes = computed(() => {
  return {
    component: [
      isOverview.value ? 'is-overview' : '',
      isProject.value ? 'is-project' : '',
      isContent.value ? 'is-content' : '',
    ],
    prev: [
      'prev',
      lastSlide.value ? 'last-slide' : '',
      firstSlide.value ? 'first-slide' : '',
      hasSingleSlide.value ? 'has-single-slide' : '',
    ],
    next: [
      'next',
      lastSlide.value ? 'last-slide' : '',
      firstSlide.value ? 'first-slide' : '',
      hasSingleSlide.value ? 'has-single-slide' : '',
    ],
  }
})

const hasSingleSlide = computed(() => {
  return slideCount.value < 2
})

const currentItem = computed(() => {
  if (!props.slides) return
  return props.slides[currentSlide.value]
})

function prev() {
  if (!slideCount.value) return
  currentSlide.value =
    (currentSlide.value - 1 + slideCount.value) % slideCount.value
}

function next() {
  if (!slideCount.value) return
  currentSlide.value = (currentSlide.value + 1) % slideCount.value
}

function stopAutoplay() {
  if (interval) clearInterval(interval)
  interval = undefined
}

function startAutoplay() {
  stopAutoplay()
  interval = setInterval(next, delay)
}

onMounted(() => {
  if (slideCount.value > 1 && props.autoplay) startAutoplay()
})

onActivated(() => {
  if (slideCount.value > 1 && props.autoplay) startAutoplay()
})

onDeactivated(() => {
  stopAutoplay()
})

onUnmounted(stopAutoplay)
</script>

<template>
  <section v-if="slideCount" class="image-slider" :class="classes.component">
    <ul class="slides">
      <transition v-if="isOverview" name="t-slide">
        <ImageSlide
          :key="`overview-slide-${currentSlide}`"
          :slide="currentItem"
          :mode="props.mode"
          :show-caption="props.showCaption"
        />
      </transition>
      <template v-else-if="isContent">
        <ImageSlide
          v-for="(slide, index) in props.slides"
          :key="`content-slide-${index}`"
          :slide="slide"
          :mode="props.mode"
          :show-caption="props.showCaption"
        />
      </template>
      <ImageSlide
        v-else
        :key="`slide-${currentSlide}`"
        :slide="currentItem"
        :mode="props.mode"
        :show-caption="props.showCaption"
      />
    </ul>
    <button type="button" :class="classes.prev" @click="prev" />
    <button type="button" :class="classes.next" @click="next" />
  </section>
</template>

<!-- <style lang="scss">
// defined in _transitions.scss, variables in _variables.scss
</style> -->

<style lang="scss" scoped>
.image-slider {
  position: relative; // for absolute positioning of slides during transition

  &.is-overview {
    @include t-slide($duration: var(--long), $delay: var(--medium));

    height: 30vh;
  }

  &.is-content {
    height: 30vh;
  }
}

.slides {
  @include list-reset;

  width: 100%;
  height: 100%;

  .is-content & {
    display: flex;
    align-items: stretch;
    overflow-x: auto;
    scroll-snap-type: x mandatory;
  }
}

.prev,
.next {
  // @extend %tap-highlight-reset;
  // @include focus-default($color: transparent);
  @include button-reset;

  position: absolute;

  // when using background images with ::before
  top: 50%;

  // when using cursor images
  // width: 50%;
  // height: 100%;

  z-index: var(--m-upper-content);
  cursor: pointer;
  transform: translateY(-50%);

  &.has-single-slide {
    display: none;
  }

  // TODO: use darker grey to be able to see the buttons on white and on any image, also thinner, not bold, maybe add hover state to it. tabbable?
  &::before {
    display: block;
    width: 15%;
    max-width: 5rem;
    content: url('../assets/images/arrow-left-big.svg');
  }
}

.prev {
  left: 0;
}

.next {
  right: 0;

  &::before {
    margin-left: auto;
    transform: scale(-1, 1);
  }
}
</style>
