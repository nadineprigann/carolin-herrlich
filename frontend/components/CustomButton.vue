<script lang="ts" setup>
const props = defineProps<{
  url?: string
  label: string
}>()

const target = reactive({
  mail: 'post@herrliche-permakultur.de',
})

const customHref = computed(() => {
  return props.url ? props.url : `mailto:${target.mail}`
})
</script>

<template>
  <!-- TODO: turn this into a button with @click="handleClick" -->
  <!-- TODO: this is temporary. instead of mail sending, open checkout overlay which sends mails to target.mail. later on, connect to shop -->
  <a :href="customHref" target="_blank" rel="noopener noreferrer">
    {{ props.label }}
  </a>
</template>

<style lang="scss" scoped>
.external-link {
  // @include link-default;
}
</style>
