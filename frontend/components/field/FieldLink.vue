<script lang="ts" setup>
const props = defineProps<{
  link: {
    alt_text?: string
    select_page: PageReference
  }
}>()

const showLink = computed(() => {
  return Object.keys(props.link).length > 0
})
</script>

<template>
  <NuxtLink v-if="showLink" :to="link.select_page.meta.url" class="field-link">
    <div v-if="link.alt_text" v-html="link.alt_text" />
    <div v-else v-html="link.select_page.fields.title" />
  </NuxtLink>
</template>

<style lang="scss" scoped>
// .field-link {}
</style>
