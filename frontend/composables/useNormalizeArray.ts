export function useNormalizeArray() {
  // this is for visual rendering only. helper to normalize query param values to array regardless if single string (only one filter selected) or array (multiple filters selected). makes sure that rendering titles of these filters in template never fails due to unexpected data type.
  function normalizeToArray(value) {
    // if value is an array, return as is
    if (Array.isArray(value)) return value
    // if value is a string, wrap in array
    if (typeof value === 'string') return [value]
    // if value is undefined or of unexpected type, return empty array
    return []
  }

  return {
    normalizeToArray,
  }
}
