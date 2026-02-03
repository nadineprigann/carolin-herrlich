// get the footnote number from a click event on a repeater-matrix-type-text element. sup is being rendered in FieldTextarea.vue but due to event bubbling, matrix type makes scoping only to this type possible and avoids populating delegateLinks with this logic.

export function footnoteNumber(event: MouseEvent): string | null {
  // get the target element from the clicked HTML element
  const target = event.target as HTMLElement

  // make sure that the note is gathered even if user didn't click actual sup element
  const sup = target.closest('sup.footnote')
  if (!sup) return null // only if textCOntent exists, return the trimmed textContent to make sure whitespaces and line breaks are removed -> predictable output
  return sup.textContent?.trim() ?? null
}
