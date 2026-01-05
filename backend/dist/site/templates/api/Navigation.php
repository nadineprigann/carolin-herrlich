<?php namespace ProcessWire;

class Navigation {
  static protected $languageSupportPageNames = null;

  public static function get($pages = null) {
    $routes = [];

    self::$languageSupportPageNames = wire('modules')->isInstalled('LanguageSupportPageNames');

    // Add default pages if parameter has not been set
    if (!isset($pages)) {
      $pages = new PageArray();
      $homepage = wire('pages')->get(1);
      $pages->add($homepage);
      $pages->add($homepage->children);
    }

    foreach ($pages as $page) {
      array_push($routes, self::createRoute($page));
    }

    // Add dynamic routes
    // array_push($routes, self::createDynamicRoute(wire('pages')->get('template=parentTemplate'), 'childTemplate', ':name'));

    return $routes;
  }

  private static function createRoute($page) {
    $page->of(true);
    $item = new \StdClass();
    $item->name = $page->id;
    $item->meta = new \StdClass();
    $item->meta->id = $page->id;
    $item->meta->template = $page->template->name;
    $item->meta->title = wire('sanitizer')->unentities($page->title);
    $item->meta->url = $page->url;
    $item->path = self::getPath($page);
    return $item;
  }

  private static function createDynamicRoute($parent, $template, $dynamicParam = '') {
    $item = new \StdClass();
    $item->name = $template;
    $item->meta = new \StdClass();
    $item->meta->id = '';
    $item->meta->template = $template;
    $item->meta->title = '';
    $item->meta->url = '';
    $item->path = self::getPath($parent, $dynamicParam);
    return $item;
  }

  private static function getPath($page, $dynamicParam = '') {
    $defaultLanguage = wire('config')->_defaultLanguage;
    $availableLanguages = wire('config')->_availableLanguages;
    $path = [];

    foreach (wire('languages') as $lang) {
      $l = $lang->isDefault() ? $defaultLanguage : $lang->name;

      // Check if language is listed in PW config
      if (!in_array($l, $availableLanguages)) continue;

      $path[] = self::$languageSupportPageNames
        ? ltrim($page->localUrl($lang), '/')
        : $page->url;
    }

    $pathString = self::$languageSupportPageNames
      ? '/(' . implode('|', $path) . ')' . $dynamicParam
      : $page->url . $dynamicParam;

    return $pathString;
  }
}
