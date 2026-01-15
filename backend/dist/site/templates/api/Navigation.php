<?php namespace ProcessWire;

class Navigation {
  static protected $languageSupportPageNames = null;

  // add parameter to determine whether to include nested children. Default = false. Add true to include nested children.
  public static function get($pages = null, $includeNestedChildren = true) {
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
      $route = self::createRoute($page);

      // Add nested children if enabled
      if ($includeNestedChildren && $page->template->name === 'level-a') {
        $route->children = self::getNestedChildren($page);
      }

      array_push($routes, $route);
    }

    // Add dynamic routes
    // array_push($routes, self::createDynamicRoute(wire('pages')->get('template=parentTemplate'), 'childTemplate', ':name'));

    return $routes;
  }

  /*
   * Get nested children for navigation structure based on specific templates
   * Returns array of route objects for the children
   * Excludes templates that don't have navigable nested children
   */
  private static function getNestedChildren($page) {
    $nestedRoutes = [];

    // Templates to exclude from nested child fetching
    $excludeTemplates = ['home', 'blog'];

    // Skip if this page's template is in the exclude list
    if (in_array($page->template->name, $excludeTemplates)) {
      return $nestedRoutes;
    }

    // Only fetch nested children if parent has specific template 'level-a'
    if ($page->template->name !== 'level-a') {
      return $nestedRoutes;
    }

    // Get first-level children. Ensures to not include pages that are trashed, even if they have the right parent
    $children = $page->children('status<' . Page::statusTrash);

    foreach ($children as $child) {
      // Create route object for each nested child without further nesting
      array_push($nestedRoutes, self::createRoute($child));
    }

    return $nestedRoutes;
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
