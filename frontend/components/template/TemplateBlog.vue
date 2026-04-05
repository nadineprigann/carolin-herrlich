<script lang="ts" setup>
interface TemplateBlog extends Page {
  children: childItem[]
}

const props = defineProps<{
  data: TemplateBlog
}>()

const { fields, breadcrumbs, categories } = toRefs(props.data)

const label = reactive({
  current: 'Aktuell',
  archive: 'Archiv',
  loadArchive: 'Archiv laden',
})

const classes = computed(() => {
  return {
    button: ['button', hasArchive.value ? '' : 'is-disabled'],
  }
})

const archiveLoaded = ref(false)

const showChildren = computed(() => {
  return props.data.children?.length > 0
})

const currentPosts = computed(() => {
  if (!showChildren.value) return []
  return props.data.children?.filter((child) => !child.meta.archived)
})

const archivedPosts = computed(() => {
  if (!showChildren.value) return []
  return props.data.children?.filter((child) => child.meta.archived)
})

const showCurrent = computed(() => {
  if (!showChildren.value) return false
  return currentPosts.value?.length > 0
})

const hasArchive = computed(() => {
  if (!showChildren.value) return false
  return archivedPosts.value?.length > 0
})

const showArchive = computed(() => {
  return hasArchive.value && archiveLoaded.value
})

const showArchiveButton = computed(() => {
  return !archiveLoaded.value
})

const loadArchive = () => {
  archiveLoaded.value = true
}
</script>

<template>
  <main class="template-blog">
    <BreadcrumbList :breadcrumbs="breadcrumbs" />
    <FieldText element="h2" :text="fields.title" class="title" />
    <!-- <FilterBar :overlay="'filter'" /> -->
    <section v-show="showCurrent" id="current-posts" class="current">
      <FieldText class="label" element="h3" :text="label.current" />
      <ChildList v-if="showChildren" :children="currentPosts" />
    </section>
    <!-- TODO: successively: automatically move posts older than X months to archive -->
    <section id="archived-posts" class="archive">
      <button
        v-if="showArchiveButton"
        type="button"
        :class="classes.button"
        :disabled="!hasArchive"
        @click="loadArchive"
        v-text="label.loadArchive"
      />
      <div v-show="showArchive">
        <FieldText class="label" element="h3" :text="label.archive" />
        <ChildList :children="archivedPosts" />
      </div>
    </section>
    <!-- <FilterOverlay
      :filters="categories"
      :template="'blog'"
      :title="fields.title"
    /> -->
  </main>
</template>

<style lang="scss" scoped>
.template-blog {
  padding: var(--page-spacing);
}

.title,
.current,
.archive,
.button {
  @include center-content;
}

.title,
.label {
  @include ff-sans;
}

.title {
  @include fs-xlarge;

  margin-bottom: var(--gutter-xl);

  @media (min-width: $medium) {
    margin-bottom: calc(var(--gutter-base) * 5);
  }
}

.button {
  @include button-default;
  @include hover-default;
  @include focus-default;
  @include center-content;

  display: flex;
  max-width: max-content;
  margin-bottom: var(--gutter-xl);

  &.is-disabled {
    color: var(--disabled-color);
    cursor: default;
    border-color: var(--disabled-color);

    // reset hover styles when disabled. focus styles do not need to be reset cuz button is disabled
    &:hover {
      box-shadow: none;
    }
  }
}

.label {
  @include fs-medium;

  padding-bottom: var(--accordion-title-spacing);
  border-bottom: 1px solid var(--black);
}

.current {
  // note: remove the following delcaration when archive is implemented

  padding-bottom: var(--page-end);
}
</style>
