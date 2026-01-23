<script lang="ts" setup>
interface TemplateEvents extends Page {
  children: childItem[]
}

const props = defineProps<{
  data: TemplateEvents
}>()

const { fields } = toRefs(props.data)

const label = reactive({
  current: 'Aktuell',
  archive: 'Archiv',
})

const showChildren = computed(() => {
  return props.data.children?.length > 0
})
</script>

<template>
  <main class="template-events">
    <FieldText element="h2" :text="fields.title" />
    <div class="current-events">
      <FieldText class="random-label" element="h3" :text="label.current" />
      <ChildList v-if="showChildren" :children="props.data.children" />
    </div>
    <!-- TODO: implement archive functionality: checkbox to mark posts as archived, filter here. successively: automatically move posts older than X months to archive -->
    <!-- <div class="archive-events">
      <FieldText class="random-label" element="h3" :text="label.archive" />
      <ChildList :children="" />
    </div> -->
  </main>
</template>

<style lang="scss" scoped>
// .template-events {}
</style>
