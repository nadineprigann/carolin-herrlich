<script lang="ts" setup>
interface TemplateBlog extends Page {
  children: childItem[]
}

const props = defineProps<{
  data: TemplateBlog
}>()

const { fields } = toRefs(props.data)

const label = reactive({
  random: 'Zufällige Einträge',
  current: 'Aktuell',
  archive: 'Archiv',
})

const showChildren = computed(() => {
  return props.data.children?.length > 0
})
</script>

<template>
  <main class="template-blog">
    <FieldText element="h2" :text="fields.title" />
    <div class="current-posts">
      <FieldText class="random-label" element="h3" :text="label.current" />
      <ChildList v-if="showChildren" :children="props.data.children" />
    </div>
    <!-- TODO: implement archive functionality: checkbox to mark posts as archived, filter here. successively: automatically move posts older than X months to archive -->
    <!-- <div class="archive-posts">
      <FieldText class="random-label" element="h3" :text="label.archive" />
      <ChildList :children="" />
    </div> -->
  </main>
</template>

<style lang="scss" scoped>
// .template-blog {}
</style>
