<?php namespace ProcessWire;

require_once __DIR__ . "/Navigation.php";

class Defaults {
  public static function get() {
    $requestedLang = Helper::setLanguage();

    $homepage = wire('pages')->get(1);

    // Prepare cache request
    $namespace = 'app-api';
    $cacheName = implode('-', ['defaults', $requestedLang]);
    $expire = 2630000;
    $omitCache = wire('config')->_omitCache;

    if ($omitCache) {
      // Get fresh data if cache should be omitted
      $cacheData = self::getData($homepage);
    } else {
      // Check if cache is available
      $cacheData = wire('cache')->getFor($namespace, $cacheName);
      if ($cacheData) {
        // If yes, then unserialize saved cache value
        $cacheData = unserialize($cacheData);
      } else {
        // If no cache available, then create it
        $cacheData = self::getData($homepage);
        $cacheSaved = wire('cache')->saveFor($namespace, $cacheName, serialize($cacheData), $expire);
        if ($cacheSaved && wire('config')->debug) wire('log')->save('app-api', "cache saved with name $cacheName");
      }
    }

    Helper::unsetLanguage();
    return $cacheData;
  }

  public static function getData($page) {
    $page->of(true);

    $response = new \StdClass();

    $defaultLang = wire('config')->_defaultLanguage;
    $availableLanguages = wire('config')->_availableLanguages;
    $languages = [];
    foreach (wire('languages') as $lang) {
      $l = $lang->isDefault() ? $defaultLang : $lang->name;
      // Check if language is listed in PW config
      if (!in_array($l, $availableLanguages)) continue;
      array_push($languages, $l);
    }
    $response->availableLanguages = $languages;

    $response->appTitle = wire('sanitizer')->unentities($page->title);
    $response->navigation = Navigation::get();

    return $response;
  }
}
