<script lang="ts" setup>
interface Props {
  element?: string
  text?: string
}

const props = withDefaults(defineProps<Props>(), {
  element: 'div',
  text: '',
})
</script>

<template>
  <component :is="props.element" v-if="props.text" class="field-text">
    <!-- eslint-disable-next-line vue/no-v-html -->
    <span v-html="props.text" />
  </component>
</template>

<style lang="scss" scoped>
// .field-text {}
</style>
