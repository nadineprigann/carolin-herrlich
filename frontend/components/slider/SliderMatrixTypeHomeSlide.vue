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
    <NuxtLink :to="props.item.link.meta.url" class="icon">
      <div class="title" v-html="props.item.title" />
      <div v-if="props.item.date_start" class="dates">
        <span v-html="props.item.date_start" />
        <span v-if="props.item.date_end" v-html="props.item.date_end" />
      </div>
      <FieldTextarea v-if="props.item.text" :text="props.item.text" />
      <FieldImage :image="props.item.image" />
      <CategoryList v-if="showCategories" :categories="props.item.categories" />
    </NuxtLink>
  </div>
</template>

<style lang="scss" scoped>
// .slider-matrix-type-home-slide {}
</style>
