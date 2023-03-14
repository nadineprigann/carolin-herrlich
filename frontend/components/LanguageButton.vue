<script lang="ts" setup>
const languageStore = useLanguageStore()
const { isoCode } = storeToRefs(languageStore)

const props = defineProps<{
  language: string
}>()

const classes = computed(() => {
  return {
    'is-current': isCurrent.value,
  }
})

const isCurrent = computed(() => {
  return props.language === isoCode.value
})

const changeLanguage = () => {
  languageStore.change(props.language)
}
</script>

<template>
  <button
    type="button"
    :class="classes"
    class="language-button"
    @click="changeLanguage"
  >
    {{ props.language }}
  </button>
</template>

<style lang="scss" scoped>
// .language-button {}
</style>
