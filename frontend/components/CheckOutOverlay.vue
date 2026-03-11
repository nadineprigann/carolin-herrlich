<script lang="ts" setup>
const api = useApi()

const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const props = defineProps<{
  // template: 'event' | 'shop' | 'offer'
  title: string
}>()

// const hasAlphabetical = ref(false)
// const hasCategorical = ref(false)
// const hasChronological = ref(false)
// const hasCyclical = ref(false)

const labels = reactive({
  overlayTitle: 'Check-Out',
  title: 'Check-Out von ',
  description:
    'Fülle die Felder aus und klicke anschließend auf "Absenden", um deine Infos und Fragen abzusenden und damit den Check-Out abzuschliessen.',
  firstName: {
    label: 'Vorname',
    id: 'firstName',
    help: 'Gib hier deinen Vornamen ein.',
    placeholder: 'Vorname',
    error: 'Bitte gib deinen Vornamen ein.',
    autocomplete: 'given-name',
  },
  lastName: {
    label: 'Nachname',
    id: 'lastName',
    help: 'Gib hier deinen Nachnamen ein.',
    placeholder: 'Nachname',
    error: 'Bitte gib deinen Nachnamen ein.',
    autocomplete: 'family-name',
  },
  pronouns: {
    label: 'Pronomen',
    id: 'pronouns',
    help: 'Gib hier dein(e) Pronomen ein.',
    placeholder: 'sie / ihr, they / them, ...',
  },
  mail: {
    label: 'E-Mail',
    id: 'mail',
    help: 'Gib hier deine E-Mail-Adresse ein.',
    placeholder: 'beispiel@domain.com',
    error: 'Bitte gib eine gültige E-Mail-Adresse ein.',
    autocomplete: 'email',
  },
  message: {
    label: 'Fragen',
    id: 'message',
    help: 'Gib hier deine Fragen oder Anmerkungen ein.',
    placeholder: 'Ich interessiere mich für ...',
  },
  submit: 'Absenden',
  sending: 'Senden...',
  reset: 'Zurücksetzen',
})

const isClicked = ref(false) // to track if submit button has been clicked

const classes = computed(() => {
  return {
    submit: ['send', isClicked.value ? 'is-clicked' : ''],
  }
})

// this will be populated by v-model bindings from the form inputs and is passed to the backend on submit
const form = reactive({
  firstName: '',
  lastName: '',
  pronouns: '',
  email: '',
  message: '',
  website: '', // honeypot field for spam protection, should be left empty by users, if filled out, submission will be rejected in backend
  started: 0, // start a timer when the form is first interacted with. if submitted too fast, it might be a bot.
})

// use accordion title for form title if available, otherwise use the one from props (e.g. from template like event). OverlayButton.vue stores accordion title in store when used within one and clicked, overlay can use it here
const formTitle = computed(() => {
  return layout.value.openOverlay.checkoutTitle
    ? `${labels.title} ${layout.value.openOverlay.checkoutTitle}`
    : `${labels.title} ${props.title}`
})

const showOverlay = computed(() => {
  return layout.value.openOverlay.checkout
})

const closeOverlay = () => {
  layout.value.openOverlay.checkout = false
  layout.value.openOverlay.checkoutTitle = null
}

const submit = async () => {
  isClicked.value = true // for submit button after click
  try {
    // use dedicated payload here instead of only form to have more control over what exactly is sent to the backend and to be able to easily add other properties if needed without changing the form state. -> checkout title
    const payload = {
      firstName: form.firstName,
      lastName: form.lastName,
      pronouns: form.pronouns,
      email: form.email,
      message: form.message,
      title: layout.value.openOverlay.checkoutTitle ?? props.title,
      website: form.website, // honeypot field for spam protection
      started: form.started, // for spam protection to abort fastly submitted forms
    }

    const response = await api.post('page/checkout/submit', payload)
    // console.log(this.response)
    if (response.status === 'success') {
      // console.log('checkout submitted')
      // Form submitted successfully
      reset() // reset form after successful submission, can also be done on close if you want to keep the entered data visible until user closes the overlay
      layout.value.openOverlay.success = true // show success overlay

      setTimeout(() => {
        isClicked.value = false // reset submit button state after delay
        layout.value.openOverlay.success = false // close success overlay
        closeOverlay() // close checkout overlay
      }, 5000)
    } else {
      // An error occured
      // TODO: show error message
      // console.error(response.message)
    }
  } catch (error) {
    // console.error('Checkout failed', error)
    // this.$formulate.handle(
    //   {
    //     formErrors: [`${error}! ${this.$t('tryAgain')}`],
    //   },
    //   'submissionForm',
    // )
  }
}

const reset = () => {
  // reset form object. v-model bindings will take care of resetting the input fields.
  form.firstName = ''
  form.lastName = ''
  form.pronouns = ''
  form.email = ''
  form.message = ''
  form.website = ''
  form.started = 0
}

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

watch(showOverlay, (open) => {
  if (open) {
    form.started = Math.floor(Date.now() / 1000)
  }
})

onDeactivated(() => {
  // reset overlay state when navigating away while overlay is open
  closeOverlay()
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
    <CloseButton :overlay-title="labels.overlayTitle" @click="closeOverlay" />

    <form class="form" @submit.prevent="submit">
      <section class="content">
        <input
          v-model="form.website"
          type="text"
          name="website"
          autocomplete="off"
          tabindex="-1"
          hidden
        />
        <FieldText :id="titleId" element="h2" :text="formTitle" class="title" />
        <p :id="descId" class="description" v-text="labels.description" />
        <FormInput
          :id="labels.firstName.id"
          v-model="form.firstName"
          :label="labels.firstName.label"
          :help="labels.firstName.help"
          :error="labels.firstName.error"
          :placeholder="labels.firstName.placeholder"
          :autocomplete="labels.firstName.autocomplete"
          :required="true"
        />
        <FormInput
          :id="labels.lastName.id"
          v-model="form.lastName"
          :label="labels.lastName.label"
          :help="labels.lastName.help"
          :error="labels.lastName.error"
          :placeholder="labels.lastName.placeholder"
          :autocomplete="labels.lastName.autocomplete"
          :required="true"
        />
        <FormInput
          :id="labels.pronouns.id"
          v-model="form.pronouns"
          :label="labels.pronouns.label"
          :help="labels.pronouns.help"
          :error="labels.pronouns.error"
          :placeholder="labels.pronouns.placeholder"
          :autocomplete="labels.pronouns.autocomplete"
        />
        <FormInput
          :id="labels.mail.id"
          v-model="form.email"
          :label="labels.mail.label"
          :help="labels.mail.help"
          :error="labels.mail.error"
          :placeholder="labels.mail.placeholder"
          :autocomplete="labels.mail.autocomplete"
          :required="true"
        />
        <FormTextarea
          :id="labels.message.id"
          v-model="form.message"
          :label="labels.message.label"
          :help="labels.message.help"
          :error="labels.message.error"
          :placeholder="labels.message.placeholder"
          :autocomplete="labels.message.autocomplete"
        />
      </section>
      <section class="controls">
        <button type="submit" class="apply">
          <span v-if="isClicked" class="label" v-text="labels.sending" />
          <span v-else class="label" v-text="labels.submit" />
        </button>
        <button type="button" class="reset" @click="reset">
          <span class="label" v-text="labels.reset" />
        </button>
      </section>
      <SuccessOverlay />
    </form>
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
  padding: var(--gutter-m) var(--gutter-s);
  overflow: hidden;
  background-color: var(--white-90);
  backdrop-filter: blur(var(--bg-blur));

  @media (min-width: $medium) {
    padding: var(--gutter-m);
  }
}

.honeypot {
  display: none;
}

.send,
.reset {
  @include button-default;
}

.description {
  @include visually-hidden;
}

.title,
.content,
.controls {
  @include center-content;
}

.content {
  display: flex;
  flex-direction: column;
  gap: 0 var(--gutter-m);

  @media (min-width: $tablet) {
    display: grid;
    grid-template-rows: repeat(3, auto) 1fr auto;
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }
}

.form {
  @include center-content;

  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 100%;
}

.title {
  @include fs-xlarge;
  @include ff-sans;

  max-width: var(--title-width);
  margin-bottom: var(--gutter-xl);

  @media (min-width: $tablet) {
    grid-column: span 2;
    margin-bottom: calc(var(--gutter-base) * 5);
    margin-left: 0; // reset centering from parent
  }
}

.field {
  display: flex;
  flex-direction: column;
}

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

.apply,
.reset {
  @include button-default;
  @include button-padding(
    $top: 0.4em,
    $bottom: var(--spacing-xs),
    $left: var(--spacing-l),
    $right: var(--spacing-l)
  );
}

.apply {
  margin-right: var(--gutter-s);
}

.formkit-actions .actions,
.controls {
  display: flex;
  justify-content: flex-end;
}
</style>
