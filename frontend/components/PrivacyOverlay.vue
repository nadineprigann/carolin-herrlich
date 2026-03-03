<script setup lang="ts">
const layoutStore = useLayoutStore()
const { layout } = storeToRefs(layoutStore)

const labels = reactive({
  overlayTitle: 'Datenschutz',
})

const closeOverlay = () => {
  layout.value.openOverlay.privacy = false
}

const isVisible = computed(() => {
  return layout.value.openOverlay.privacy
})
</script>

<template>
  <transition name="legal" mode="">
    <section v-if="isVisible" class="privacy-overlay">
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

        <FieldText
          :id="'privacy-policy-introduction'"
          element="h3"
          class="subtitle"
          text="Grundlegendes"
          aria-describedby="privacy-policy-purpose privacy-policy-updates privacy-policy-definitions"
        />
        <p id="privacy-policy-purpose" class="text">
          Diese Datenschutzerklärung soll die Nutzenden dieser Website über die
          Art, den Umfang und den Zweck der Erhebung und Verwendung
          personenbezogener Daten durch den Websitebetreibenden informieren.
        </p>

        <p id="privacy-policy-updates" class="text">
          Die Websitebetreibende nimmt deinen Datenschutz sehr ernst und
          behandelt deine personenbezogenen Daten vertraulich und entsprechend
          der gesetzlichen Vorschriften. Da durch neue Technologien und die
          ständige Weiterentwicklung dieser Webseite Änderungen an dieser
          Datenschutzerklärung vorgenommen werden können, empfehle ich dir, dir
          die Datenschutzerklärung in regelmäßigen Abständen wieder
          durchzulesen.
        </p>

        <p id="privacy-policy-definitions" class="text">
          Definitionen der verwendeten Begriffe (z.B. “personenbezogene Daten”
          oder “Verarbeitung”) findest du in Art. 4 DSGVO.
        </p>

        <FieldText
          :id="'data-collection-reason'"
          class="subtitle"
          text="Zugriffsdaten"
          aria-describedby="data-collection-list data-collection-details"
        />
        <p class="text">
          Ich, die Websitebetreibende bzw. Seitenprovider, erhebe aufgrund
          meines berechtigten Interesses (s. Art. 6 Abs. 1 lit. f. DSGVO) Daten
          über Zugriffe auf die Website und speichere diese als
          „Server-Logfiles“ auf dem Server der Website ab. Folgende Daten werden
          so protokolliert:
        </p>

        <ul id="data-collection-list" class="list">
          <li>Besuchte Website</li>
          <li>Uhrzeit zum Zeitpunkt des Zugriffes</li>
          <li>Menge der gesendeten Daten in Byte</li>
          <li>Quelle/Verweis, von welchem du auf die Seite gelangtest</li>
          <li>Verwendeter Browser</li>
          <li>Verwendetes Betriebssystem</li>
          <li>Verwendete IP-Adresse</li>
        </ul>

        <p id="data-collection-details" class="text">
          Die Server-Logfiles werden für maximal 7 Tage gespeichert und
          anschließend gelöscht. Die Speicherung der Daten erfolgt aus
          Sicherheitsgründen, um z. B. Missbrauchsfälle aufklären zu können.
          Müssen Daten aus Beweisgründen aufgehoben werden, sind sie solange von
          der Löschung ausgenommen bis der Vorfall endgültig geklärt ist.
          Gehostet wird die Website bei
          <a
            href="https://www.biohost.de/"
            class="link"
            aria-label="Link to website of hoster"
            >BioHost</a
          >, einem nachhaltigen Hosting-Anbieter, der seinen Serverstandort in
          Deutschland hat.
        </p>

        <FieldText class="subtitle" text="Umgang mit Kontaktdaten" />
        <p class="text">
          Nimmst du mit mir als Websitebetreibende durch die angebotenen
          Kontaktmöglichkeiten Verbindung auf, werden deine Angaben gespeichert,
          damit auf diese zur Bearbeitung und Beantwortung deiner Anfrage
          zurückgegriffen werden kann. Im konkreten Fall findet dies bei Nutzung
          des E-Mail-Links durch die Angabe deiner E-Mail-Adresse statt. Diese
          Daten werden regelmässig gelöscht, jedoch nicht, wenn Anfragen noch
          offen oder ungeklärt sind. Solltest du diese kurzfristige Speicherung
          nicht wünschen, kannst du dich jederzeit mit einer Löschungsanfrage an
          mich wenden. Weiter werden ohne deine Einwilligung diese gespeicherten
          Daten nicht an Dritte weitergegeben.
        </p>

        <FieldText class="subtitle" text="Personenbezogene Daten" />
        <p class="text">
          Es werden keine personenbezogenen Daten als die oben genannten
          gesammelt oder verarbeitet.
        </p>

        <FieldText class="subtitle" text="Rechte des Nutzenden" />
        <p class="text">
          Du hast als nutzende Person das Recht, auf Antrag eine kostenlose
          Auskunft darüber zu erhalten, welche personenbezogenen Daten über dich
          gespeichert wurden. Du hast außerdem das Recht auf Berichtigung
          falscher Daten und auf die Verarbeitungseinschränkung oder Löschung
          deiner personenbezogenen Daten. Falls zutreffend, kannst du auch dein
          Recht auf Datenportabilität geltend machen. Solltest du annehmen, dass
          deine Daten unrechtmäßig verarbeitet wurden, kannst du eine Beschwerde
          bei der zuständigen Aufsichtsbehörde einreichen.
        </p>

        <FieldText class="subtitle" text="Löschung von Daten" />
        <p class="text">
          Sofern dein Wunsch nicht mit einer gesetzlichen Pflicht zur
          Aufbewahrung von Daten (z. B. Vorratsdatenspeicherung) kollidiert,
          hast du ein Anrecht auf Löschung deiner Daten. Von mir gespeicherte
          Daten werden, sollten sie für ihre Zweckbestimmung nicht mehr vonnöten
          sein und es keine gesetzlichen Aufbewahrungsfristen geben, gelöscht.
          Falls eine Löschung nicht durchgeführt werden kann, da die Daten für
          zulässige gesetzliche Zwecke erforderlich sind, erfolgt eine
          Einschränkung der Datenverarbeitung. In diesem Fall werden die Daten
          gesperrt und nicht für andere Zwecke verarbeitet.
        </p>

        <FieldText
          id="objection"
          class="subtitle"
          text="Widerspruchsrecht"
          aria-describedby="right-of-objection objection-info"
        />
        <p id="right-of-objection" class="text">
          Nutzende dieser Webseite können von ihrem Widerspruchsrecht Gebrauch
          machen und der Verarbeitung ihrer personenbezogenen Daten zu jeder
          Zeit widersprechen.
        </p>

        <p id="objection-info" class="text">
          Wenn du eine Berichtigung, Sperrung, Löschung oder Auskunft über die
          zu deiner Person gespeicherten personenbezogenen Daten wünschst oder
          Fragen bzgl. der Erhebung, Verarbeitung oder Verwendung deiner
          personenbezogenen Daten hast oder erteilte Einwilligungen widerrufen
          möchtest, wende dich bitte an folgende E-Mail-Adresse:
          <a href="mailto:post@herrliche-permakultur.de" class="link">
            <!-- note: to avoid bots using the adress, consider obfuscation (ät, ...).
          format like so: hallo<span>...</span>@domain.com -->
            post<span class="spamblock">spamblock</span
            >@herrliche-permakultur.de
          </a>
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
.privacy-overlay {
  position: fixed;
  bottom: 0;
  left: 0;
  z-index: var(--xxl-overlay);
  display: grid;
  grid-template-rows: auto minmax(auto, 1fr);
  width: 100vw;
  height: 95vh;
  overflow-y: scroll;
  background-color: var(--white-90);
  backdrop-filter: blur(var(--bg-blur));
  border-top: 1px solid var(--black);
}

.content {
  @include center-content;
}

.title {
  @include ff-sans;
  @include fs-xlarge;
}

.subtitle {
  @include ff-sans;
  @include fs-large;
}

.spamblock {
  display: none;
}
</style>
