<script setup lang="ts">
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const labels = reactive({
  overlayTitle: 'Impressum',
})

const closeOverlay = () => {
  layout.value.openOverlay.imprint = false
}

const isVisible = computed(() => {
  return layout.value.openOverlay.imprint
})

watch(isVisible, (newValue) => {
  if (newValue) {
    document.body.style.overflow = 'hidden'
  } else {
    document.body.style.overflow = ''
  }
})
</script>

<template>
  <transition name="legal" mode="">
    <section v-if="isVisible" class="imprint-overlay">
      <CloseButton :overlay-title="labels.overlayTitle" @click="closeOverlay" />
      <div class="content">
        <FieldText element="h2" :text="labels.overlayTitle" class="title" />
        <FieldText
          :id="'responsible-person'"
          element="h3"
          class="subtitle"
          text="Verantwortliche Ansprechperson"
        />

        <p id="name-of-responsible-person">Carolin Herrlich</p>
        <a
          href="mailto:post@herrliche-permakultur.de"
          class="link"
          aria-label="e-mail-adress of responsible person"
        >
          <!-- note: to avoid bots using the adress, consider obfuscation (ät, ...).
          format like so: hallo<span>...</span>@domain.com -->
          post<span class="spamblock">spamblock</span
          >@herrliche-permakultur.de</a
        >

        <!-- <h3 class="subtitle">
        Umsatzsteuer-Identifikationsnummer gem. § 27 a Umsatzsteuergesetz
      </h3>
      <p>TEMPLATE_VAT</p> -->

        <!-- please read the follwoing text carefully to make sure you're using the correct salutation for your users and yourself. -->
        <FieldText
          :id="'disclaimer'"
          class="subtitle"
          aria-describedby="description of disclaimer"
          element="h3"
          text="Haftungsausschluss / Disclaimer, Haftung für Inhalte"
        />
        <p id="description of disclaimer" class="text">
          Alle Inhalte meines Internetauftritts wurden mit größter Sorgfalt und
          nach bestem Gewissen erstellt. Für die Richtigkeit, Vollständigkeit
          und Aktualität der Inhalte kann ich jedoch keine Gewähr übernehmen.
          Als Diensteanbieterin bin ich gemäß § 7 Abs. 1 DDG für eigene Inhalte
          auf diesen Seiten nach den allgemeinen Gesetzen verantwortlich. Nach
          §§ 8 bis 10 DDG bin ich als Diensteanbieterin jedoch nicht
          verpflichtet, übermittelte oder gespeicherte fremde Informationen zu
          überwachen oder nach Umständen zu forschen, die auf eine rechtswidrige
          Tätigkeit hinweisen. Verpflichtungen zur Entfernung oder Sperrung der
          Nutzung von Informationen nach den allgemeinen Gesetzen bleiben
          hiervon unberührt. Eine diesbezügliche Haftung ist jedoch erst ab dem
          Zeitpunkt der Kenntniserlangung einer konkreten Rechtsverletzung
          möglich. Bei Bekanntwerden von den o.g. Rechtsverletzungen werde ich
          diese Inhalte unverzüglich entfernen.
        </p>

        <FieldText
          :id="'limits-of-warranty'"
          class="subtitle"
          aria-describedby="description of warranty limits"
          element="h3"
          text="Haftungsbeschränkung für externe Links"
        />
        <p id="description of warranty limits" class="text">
          Meine Webseite enthält Links auf externe Webseiten Dritter. Auf die
          Inhalte dieser direkt oder indirekt verlinkten Webseiten habe ich
          keinen Einfluss. Daher kann ich für die „externen Links“ auch keine
          Gewähr auf Richtigkeit der Inhalte übernehmen. Für die Inhalte der
          externen Links sind die jeweiligen Anbietenden oder Betreibenden
          (Urhebende) der Seiten verantwortlich. Die externen Links wurden zum
          Zeitpunkt der Linksetzung auf eventuelle Rechtsverstöße überprüft und
          waren im Zeitpunkt der Linksetzung frei von rechtswidrigen Inhalten.
          Eine ständige inhaltliche Überprüfung der externen Links ist ohne
          konkrete Anhaltspunkte einer Rechtsverletzung nicht möglich. Bei
          direkten oder indirekten Verlinkungen auf die Webseiten Dritter, die
          außerhalb meines Verantwortungsbereichs liegen, würde eine
          Haftungsverpflichtung ausschließlich in dem Fall nur bestehen, wenn
          ich von den Inhalten Kenntnis erlangen und es mir technisch möglich
          und zumutbar wäre, die Nutzung im Falle rechtswidriger Inhalte zu
          verhindern. Diese Haftungsausschlusserklärung gilt auch für innerhalb
          des eigenen Internetauftrittes www.herrliche-permakultur.de gesetzte
          Links und Verweise. Für illegale, fehlerhafte oder unvollständige
          Inhalte und insbesondere für Schäden, die mir der Nutzung oder
          Nichtnutzung solcherart dargestellten Informationen entstehen, haftet
          allein der Diensteanbietende der Seite, auf welche verwiesen wurde,
          nicht derjenige, der über Links auf die jeweilige Veröffentlichung
          lediglich verweist. Werden mir Rechtsverletzungen bekannt, werden die
          externen Links durch mich unverzüglich entfernt.
        </p>

        <FieldText
          :id="'licensing-and-copyright'"
          class="subtitle"
          aria-describedby="description of licensing and copyright"
          element="h3"
          text="Lizensierung und Urheberrecht"
        />
        <p id="description of licensing and copyright" class="text">
          Der Quellcode der Seite wurde von
          <a
            href="https://www.nadineprigann.de/"
            class="link"
            target="_blank"
            rel="noopener"
            >Nadine Prigann</a
          >
          erstellt. Er ist OpenSource und mit der
          <a
            href="https://choosealicense.com/licenses/gpl-3.0/"
            class="link"
            target="_blank"
            rel="noopener"
            >GPL-3.0-Lizenz</a
          >
          lizensiert. Eine entsprechende Vorlage findest du
          <a
            href="https://github.com/nadineprigann/landing-page"
            class="link"
            target="_blank"
            rel="noopener"
            >in diesem Projekt</a
          >
          von
          <a
            href="https://www.nadineprigann.de/"
            class="link"
            target="_blank"
            rel="noopener"
            >Nadine Prigann</a
          >. Downloads und Kopien dieser Seite sind somit für den privaten und
          kommerziellen Gebrauch unter Beachtung der folgenden Urheberrechte
          gestattet:
          <a
            href="https://www.nadineprigann.de/"
            class="link"
            target="_blank"
            rel="noopener"
            >Nadine Prigann</a
          >, die Urheberin des Quellcodes, muss genannt werden. Das Logo stammt
          von
          <a
            href="http://www.cegewe-concept.de/"
            rel="noopener"
            target="blank"
            class="link"
          >
            Claudia Große Wiesmann</a
          >. Weiter unterliegen die auf meiner Webseite veröffentlichen Inhalte
          und Werke dem deutschen Urheberrecht. Die Vervielfältigung,
          Bearbeitung, Verbreitung und jede Art der Verwertung des geistigen
          Eigentums in ideeller und materieller Sicht des Urhebenden außerhalb
          der Grenzen des Urheberrechtes bedürfen der vorherigen schriftlichen
          Zustimmung des jeweiligen Urhebenden i.S.d. Urhebergesetzes. Sind die
          Inhalte auf meiner Webseite nicht von mir erstellt worden, sind die
          Urheberrechte Dritter zu beachten. Die Inhalte Dritter werden als
          solche kenntlich gemacht. Solltest du trotzdem auf eine
          Urheberrechtsverletzung aufmerksam werden, bitte ich um einen
          entsprechenden Hinweis. Bei Bekanntwerden von Rechtsverletzungen werde
          ich derartige Inhalte unverzüglich entfernen.
        </p>
      </div>
    </section>
  </transition>
</template>

<style lang="scss">
// defined in _transitions.scss
@include t-legal;
</style>

<style lang="scss" scoped>
.imprint-overlay {
  position: fixed;
  bottom: 0;
  left: 0;
  z-index: var(--xl-overlay);
  display: grid;
  grid-template-rows: auto minmax(auto, 1fr);
  width: 100vw;
  height: 100vh;
  padding: var(--gutter-m) var(--gutter-s) calc(var(--gutter-base) * 5)
    var(--gutter-s);
  overflow-y: scroll;
  background-color: var(--white-90);
  backdrop-filter: blur(var(--bg-blur));

  @media (min-width: $tablet) {
    padding: var(--gutter-m) 0 calc(var(--gutter-base) * 6) 0;
  }
}

.content {
  @include center-content;
}

.title {
  @include ff-sans;
  @include fs-xlarge;

  margin-bottom: calc(var(--blank-line) * 1);
}

.subtitle {
  @include ff-sans;
  @include fs-large;

  max-width: 80vw;
  margin-top: calc(var(--blank-line) * 1);
  margin-bottom: calc(var(--blank-line) * 0.5);
}

.text {
  text-align: justify;
}

.text,
.list {
  &:not(:last-child) {
    margin-bottom: var(--blank-line);
  }
}

.spamblock {
  display: none;
}
</style>
