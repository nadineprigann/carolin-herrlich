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
    <NuxtLink :to="props.item.link.meta.url" class="link">
      <div class="title" v-text="props.item.title" />
      <div v-if="props.item.date_start" class="dates">
        <span v-text="props.item.date_start" />
        <span v-if="props.item.date_end" v-text="props.item.date_end" />
      </div>
      <FieldTextarea v-if="props.item.text" :text="props.item.text" />
    </NuxtLink>
    <FieldImage :image="props.item.image" />
    <CategoryList v-if="showCategories" :categories="props.item.categories" />
  </div>
</template>

<style lang="scss" scoped>
// .slider-matrix-type-home-slide {}
</style>
