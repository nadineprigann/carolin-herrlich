<script lang="ts" setup>
// import { FormKitProvider } from '@formkit/vue'
// import { de } from '@formkit/i18n'

const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const props = defineProps<{
  template: 'event' | 'shop' | 'offer'
  title: string
}>()

// use FormKitProvider to set up the configuration for FormKit in this component. This way, we can easily override default messages and locales for validation and UI strings. better: set this in a specific config file and import it in main.ts
// const localFormKitConfig = {
//   locales: { de },
//   locale: 'de',
// override only what you want:
// messages: {
//   de: {
//     validation: {
//       required: 'Bitte dieses Feld ausfüllen.',
//       email: 'Bitte eine gültige E-Mail-Adresse eingeben.',
//     },
//     // you can also override UI strings, e.g. submit/incomplete, etc.
//     // ui: { ... }
//   },
// },
// }

// const hasAlphabetical = ref(false)
// const hasCategorical = ref(false)
// const hasChronological = ref(false)
// const hasCyclical = ref(false)

const labels = reactive({
  buttonClose: 'Check-Out schliessen',
  title: 'Check-Out von ',
  description:
    'Fülle die Felder aus und klicke anschließend auf "Absenden", um deine Infos und Fragen abzusenden und damit den Check-Out abzuschliessen.',
  firstName: {
    label: 'Vorname',
    help: 'Gib hier deinen Vornamen ein.',
    placeholder: 'Vorname',
    error: 'Bitte gib deinen Vornamen ein.',
  },
  lastName: {
    label: 'Nachname',
    help: 'Gib hier deinen Nachnamen ein.',
    placeholder: 'Nachname',
    error: 'Bitte gib deinen Nachnamen ein.',
  },
  pronouns: {
    label: 'Pronomen',
    help: 'Gib hier dein(e) Pronomen ein.',
    placeholder: 'sie / ihr, they / them, ...',
  },
  mail: {
    label: 'E-Mail',
    help: 'Gib hier deine E-Mail-Adresse ein.',
    placeholder: 'beispiel@domain.com',
    error: 'Bitte gib eine gültige E-Mail-Adresse ein.',
  },
  message: {
    label: 'Fragen',
    help: 'Gib hier deine Fragen oder Anmerkungen ein.',
    placeholder: 'Ich interessiere mich für ...',
  },
  submit: 'Absenden',
  reset: 'Zurücksetzen',
})

const formTitle = computed(() => {
  return `${labels.title} ${props.title}`
})

const showOverlay = computed(() => {
  return layout.value.openOverlay.checkout
})

const closeOverlay = () => {
  layout.value.openOverlay.checkout = false
}

const send = () => {
  // ... applying logic
  closeOverlay()
}
const reset = () => {}

const titleId = `checkout-titel`
const descId = `checkout-beschreibung`

// show sections of filters based on template
watchEffect(() => {
  // hasAlphabetical.value = true
  // hasCategorical.value = true
  // const advanced = props.template !== 'tools'
  // hasChronological.value = advanced
  // hasCyclical.value = advanced
})
</script>

<template>
  <section
    v-if="showOverlay"
    role="dialog"
    aria-modal="true"
    :aria-labelledby="titleId"
    :aria-describedby="descId"
    tabindex="-1"
    class="checkout-overlay"
    @keydown.esc.prevent.stop="closeOverlay"
  >
    <button
      type="button"
      class="close"
      :aria-label="labels.buttonClose"
      @click="closeOverlay"
    >
      <span class="label" />
    </button>
    <form class="form" @submit.prevent="send">
      <div class="content">
        <FieldText :id="titleId" element="h2" :text="formTitle" class="title" />
        <p :id="descId" class="description" v-text="labels.description" />
        <div class="field">
          <label for="firstName" v-text="labels.firstName.label" />
          <input
            id="firstName"
            type="text"
            name="firstName"
            autocomplete="given-name"
            :placeholder="labels.firstName.placeholder"
            class="input"
            required
            :aria-describedby="'firstName-help firstName-error'"
          />
          <FieldText
            id="firstName-help"
            class="help"
            element="p"
            :text="labels.firstName.help"
          />
          <!-- <FieldText
            id="firstName-error"
            class="error"
            element="p"
            :text="labels.firstName.error"
          /> -->
        </div>
        <div class="field">
          <label for="lastName" v-text="labels.lastName.label" />
          <input
            id="lastName"
            type="text"
            name="lastName"
            autocomplete="family-name"
            :placeholder="labels.lastName.placeholder"
            class="input"
            required
            :aria-describedby="'lastName-help lastName-error'"
          />
          <FieldText
            id="lastName-help"
            class="help"
            element="p"
            :text="labels.lastName.help"
          />
          <!-- <FieldText
            id="lastName-error"
            class="error"
            element="p"
            :text="labels.lastName.error"
          /> -->
        </div>
        <div class="field">
          <label for="pronouns" v-text="labels.pronouns.label" />
          <input
            id="pronouns"
            type="text"
            autocomplete="off"
            name="pronouns"
            :placeholder="labels.pronouns.placeholder"
            class="input"
            :aria-describedby="'pronouns-help'"
          />
          <FieldText
            id="pronouns-help"
            class="help"
            element="p"
            :text="labels.pronouns.help"
          />
        </div>
        <div class="field">
          <label for="mail" v-text="labels.mail.label" />
          <input
            id="mail"
            type="email"
            name="mail"
            autocomplete="email"
            :placeholder="labels.mail.placeholder"
            class="input"
            required
            :aria-describedby="'mail-help mail-error'"
          />
          <FieldText
            id="mail-help"
            class="help"
            element="p"
            :text="labels.mail.help"
          />
          <!-- <FieldText
            id="mail-error"
            class="error"
            element="p"
            :text="labels.mail.error"
          /> -->
        </div>
        <div class="field">
          <label for="message" v-text="labels.message.label" />
          <textarea
            id="message"
            name="message"
            autocomplete="off"
            :placeholder="labels.message.placeholder"
            class="input"
            :aria-describedby="'message-help'"
          ></textarea>
          <FieldText
            id="message-help"
            class="help"
            element="p"
            :text="labels.message.help"
          />
        </div>
      </div>
      <div class="controls">
        <button type="submit" class="apply">
          <span class="label" v-text="labels.submit" />
        </button>
        <button type="button" class="reset" @click="reset">
          <span class="label" v-text="labels.reset" />
        </button>
      </div>
    </form>

    <!-- <FormKitProvider :config="localFormKitConfig"> -->
    <!-- <FormKit
      type="form"
      :actions="false"
      :actions-class="'actions'"
      :form-class="'form'"
      @submit="submit"
    > -->
    <!-- <div class="wrapper"> -->
    <!-- submit-label="Bestellen" -->
    <!-- <FormKit
        type="text"
        name="firstName"
        :label="labels.firstName.label"
        :help="labels.firstName.help"
        :placeholder="labels.firstName.placeholder"
        validation="required"
        autocomplete="given-name"
        class="input"
      />
      <FormKit
        type="text"
        name="lastName"
        :label="labels.lastName.label"
        :help="labels.lastName.help"
        :placeholder="labels.lastName.placeholder"
        validation="required"
        autocomplete="family-name"
        class="input"
      />
      <FormKit
        type="text"
        name="pronouns"
        :label="labels.pronouns.label"
        :help="labels.pronouns.help"
        :placeholder="labels.pronouns.placeholder"
        validation="optional"
        autocomplete="off"
        class="input"
      />
      <FormKit
        type="text"
        name="mail"
        :label="labels.mail.label"
        :help="labels.mail.help"
        :placeholder="labels.mail.placeholder"
        validation="required|email"
        autocomplete="email"
        class="input"
      />
      <FormKit
        type="textarea"
        name="message"
        :label="labels.message.label"
        :help="labels.message.help"
        :placeholder="labels.message.placeholder"
        validation="optional"
        autocomplete="off"
        class="input"
      /> -->
    <!-- </div>

    </FormKit> -->
    <!-- <button
      type="button"
      class="close"
      aria-label="Filter schließen"
      @click="closeOverlay"
    >
      <span class="label" />
    </button> -->

    <!-- <section class="content">
      <FieldText :id="titleId" element="h2" :text="labels.title" />
      <p :id="descId" class="description">
        Wähle Filter aus und klicke anschließend auf „Anwenden“, um die Liste zu
        aktualisieren.
      </p>
      <div
        v-if="hasAlphabetical"
        role="group"
        :aria-labelledby="`${titleId}-alphabetisch`"
      >
        <FieldText
          :id="`${titleId}-alphabetisch`"
          element="h3"
          :text="labels.alphabetical.title"
        />
        <div class="buttons">
          <FilterButton :title="labels.alphabetical.aToZ" />
          <FilterButton :title="labels.alphabetical.zToA" />
        </div>
      </div>
      <div
        v-if="hasCategorical"
        role="group"
        :aria-labelledby="`${titleId}-kategorisch`"
      >
        <FieldText
          :id="`${titleId}-kategorisch`"
          element="h3"
          :text="labels.categorical.title"
        />
        <div class="buttons">
          <FilterButton v-for="item in filters" :key="item.id" :filter="item" />
        </div>
      </div>
      <div
        v-if="hasChronological"
        role="group"
        :aria-labelledby="`${titleId}-chronologisch`"
      >
        <FieldText
          :id="`${titleId}-chronologisch`"
          element="h3"
          :text="labels.chronological.title"
        />
        <div class="buttons">
          <FilterButton :title="labels.chronological.currFut" />
          <FilterButton :title="labels.chronological.futCurr" />
        </div>
      </div>
      <div
        v-if="hasCyclical"
        role="group"
        :aria-labelledby="`${titleId}-zyklisch`"
      >
        <FieldText
          :id="`${titleId}-zyklisch`"
          element="h3"
          :text="labels.cyclical.title"
        />
        <div class="buttons">
          <FilterButton :title="labels.cyclical.spring" />
          <FilterButton :title="labels.cyclical.summer" />
          <FilterButton :title="labels.cyclical.autumn" />
          <FilterButton :title="labels.cyclical.winter" />
        </div>
      </div> -->
    <!-- TODO: get array of selected filters and only on apply, update query and store them in store to make them availbale for parent to filter their children -->

    <!-- </section> -->
    <!-- </FormKitProvider> -->
  </section>
</template>

<style lang="scss" scoped>
.checkout-overlay {
  position: fixed;
  top: 0;
  left: 0;
  z-index: var(--xl-overlay);
  display: grid;
  grid-template-rows: auto minmax(auto, 1fr);
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  background-color: var(--white-90);
  backdrop-filter: blur(var(--bg-blur));
}

.close,
.send,
.reset {
  @include button-reset;
}

.close {
  position: relative;
  z-index: var(--xxl-overlay);
  justify-self: flex-end;
  padding: var(--gutter);

  &::before {
    content: var(--l-close);
  }
}

.description {
  @include visually-hidden;
}

.title,
.content,
.controls {
  @include center-content;
}

// FormKit
// .formkit-form {
.form {
  @include center-content;

  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 100%;
}

.title {
  grid-column: span 2;
  max-width: var(--title-width);
  margin-left: 0; // reset centering from parent
}

.content {
  display: grid;
  grid-template-rows: repeat(3, auto) 1fr auto;
  grid-template-columns: repeat(2, minmax(0, 1fr));
}

.field {
  display: flex;
  flex-direction: column;

  // gap: 0.25rem;
}

// .formkit-input {
.input {
  @include input-default;

  grid-column: span 1;

  // width: 100% !important;
}

.buttons {
  display: flex;
  flex-wrap: wrap;
  max-width: 80vw;
}

.formkit-actions .actions,
.controls {
  display: flex;
  justify-content: flex-end;
}

.send,
.reset {
  @include button-default;
}
</style>
