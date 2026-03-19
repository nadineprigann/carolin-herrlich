<script lang="ts" setup>
import { htmlOverflowLock } from '@/composables/useHtmlOverflowLock'
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
  feedbackSending: 'Deine Daten werden gesendet. Ein wenig Geduld bitte ...',
  feedbackError:
    'Beim Absenden ist ein Fehler aufgetreten. Bitte versuche es erneut.',
})

const isSubmitted = ref(false) // to track if submit button has been clicked
const hasErrors = ref(false) // to track if there are errors in the form submission

const classes = computed(() => {
  return {
    section: ['checkout-overlay', isSubmitted.value ? 'is-submitted' : ''],
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

const isVisible = computed(() => {
  return layout.value.openOverlay.checkout
})

const closeOverlay = () => {
  layout.value.openOverlay.checkout = false
  layout.value.openOverlay.checkoutTitle = null
}

const submit = async () => {
  isSubmitted.value = true // for submit button after click
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
      layout.value.openOverlay.success = true // show success overlay

      setTimeout(() => {
        reset() // reset form after successful submission. with timeout to keep the entered data visible until success-overlay is really open
        isSubmitted.value = false // reset submit button state after delay
        layout.value.openOverlay.success = false // close success overlay
        closeOverlay() // close checkout overlay
      }, 5000)
    } else {
      // An error occured
      hasErrors.value = true
      console.error(response.message)
    }
  } catch (error) {
    console.error('Der Check-Out hat leider nicht funktioniert.', error)
    hasErrors.value = true
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

watch(isVisible, (open) => {
  if (open) {
    form.started = Math.floor(Date.now() / 1000)
  }
})

onDeactivated(() => {
  // reset overlay state when navigating away while overlay is open
  closeOverlay()
})

// use composable to stop the body from scrolling when overlay is open. also resets the overflow on unmount and deactivated
htmlOverflowLock(isVisible)
</script>

<template>
  <transition name="t-fade">
    <section
      v-if="isVisible"
      role="dialog"
      aria-modal="true"
      :aria-labelledby="titleId"
      :aria-describedby="descId"
      tabindex="-1"
      :class="classes.section"
      @keydown.esc.prevent.stop="closeOverlay"
    >
      <CloseButton :overlay-title="labels.overlayTitle" @click="closeOverlay" />

      <form class="form" @submit.prevent="submit">
        <fieldset class="wrapper" :disabled="isSubmitted">
          <section class="content">
            <input
              v-model="form.website"
              type="text"
              name="website"
              autocomplete="off"
              tabindex="-1"
              hidden
            />
            <FieldText
              :id="titleId"
              element="h2"
              :text="formTitle"
              class="title"
            />
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
              :disabled="isSubmitted"
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
              :disabled="isSubmitted"
            />
            <FormInput
              :id="labels.pronouns.id"
              v-model="form.pronouns"
              :label="labels.pronouns.label"
              :help="labels.pronouns.help"
              :error="labels.pronouns.error"
              :placeholder="labels.pronouns.placeholder"
              :autocomplete="labels.pronouns.autocomplete"
              :disabled="isSubmitted"
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
              :disabled="isSubmitted"
            />
            <FormTextarea
              :id="labels.message.id"
              v-model="form.message"
              :label="labels.message.label"
              :help="labels.message.help"
              :error="labels.message.error"
              :placeholder="labels.message.placeholder"
              :autocomplete="labels.message.autocomplete"
              :disabled="isSubmitted"
            />
          </section>
          <section class="feedback">
            <p
              v-if="isSubmitted"
              class="feedback-sending"
              v-text="labels.feedbackSending"
            />
            <p
              v-else-if="hasErrors"
              class="feedback-error"
              v-text="labels.feedbackError"
            />
          </section>
          <section class="controls">
            <button type="submit" class="submit" :disabled="isSubmitted">
              <span v-if="isSubmitted" class="label" v-text="labels.sending" />
              <span v-else class="label" v-text="labels.submit" />
            </button>
            <button
              type="button"
              class="reset"
              :disabled="isSubmitted"
              @click="reset"
            >
              <span class="label" v-text="labels.reset" />
            </button>
          </section>
        </fieldset>
        <SuccessOverlay />
      </form>
    </section>
  </transition>
</template>

<style lang="scss">
// defined in _transitions.scss
@include t-fade($duration: var(--short));
</style>

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

  height: 100%;
}

.wrapper {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 100%;

  .is-submitted & {
    cursor: progress;
  }
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

.feedback {
  display: flex;
  grid-column: span 2;
  justify-content: center;
  padding: var(--gutter-xl) 0;
}

.buttons {
  display: flex;
  flex-wrap: wrap;
  max-width: 80vw;
}

.submit {
  margin-right: var(--gutter-s);
}

.submit,
.reset {
  @include button-default;
  @include button-padding(
    $top: 0.4em,
    $bottom: var(--spacing-xs),
    $left: var(--spacing-l),
    $right: var(--spacing-l)
  );
  @include hover-default;
  @include focus-default;

  .is-submitted & {
    color: var(--disabled-color);
    cursor: progress;
    border-color: var(--disabled-color);

    // reset hover styles when disabled. focus styles do not need to be reset cuz button is disabled
    &:hover {
      box-shadow: none;
    }
  }
}

.formkit-actions .actions,
.controls {
  display: flex;
  justify-content: flex-end;
}
</style>
