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
      if ($includeNestedChildren) {
        $route->children = self::getNestedChildren($page);
      }

      array_push($routes, $route);
    }

    // Add dynamic routes
    // array_push($routes, self::createDynamicRoute(wire('pages')->get('template=parentTemplate'), 'childTemplate', ':name'));
    array_push($routes, self::createDynamicRoute(wire('pages')->get('template=tools'), 'tool', ':tool')); //
    array_push($routes, self::createDynamicRoute(wire('pages')->get('template=projects'), 'project', ':project'));
    array_push($routes, self::createDynamicRoute(wire('pages')->get('template=blog'), 'blog-post', ':blog-post'));
    array_push($routes, self::createDynamicRoute(wire('pages')->get('template=events'), 'event', ':event'));

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

  // return breadcrums for a given page
  public static function getBreadcrumbs(Page $page) {

  // No breadcrumbs on home itself
    if ($page->template->name === 'home') return;

    $breadcrumbs = [];

    // Get all parents of the current page. Exclude home and hierarchical pages for purely visual structure (Level A) from breadcrumbs
    $items = $page->parents('template!=home, template!=level-a')->add($page);
    $last  = $items->last();

    foreach ($items as $item) {
      // Create route object for each breadcrumb item
      $route = self::createRoute($item);
      // Determine if breadcrumb is clickable, except the last item bc = current page
      $route->meta->clickable = $item->id !== $last->id;

      $breadcrumbs[] = $route;
    }

    return $breadcrumbs;
  }
  // TODO: add const which holds all templates and prefixes, then resolve via selector builder to be able to maintain templates in one place
  // private const CHAPTER_NAV_TEMPLATES = ['chapter', 'summary', 'offer'];
  // Template eligibility: chapter, summary, offer-* (prefix)
  private static function isChapterNavEligible(Page $page): bool {
    // add templates that will receive the chapter nav. exact match and prefix etc. possible.
    $eligibleTemplates = ['chapter', 'summary', 'offer'];
    $template = $page->template->name;

    foreach ($eligibleTemplates as $eligible) {
      if ($template === $eligible || str_starts_with($template, $eligible . '-')) {
        return true;
      }
    }
    return false;
  }

  // Returns prev/next route objects for "chapter navigation" or null if not applicable.
  // - Only active on templates: chapter, summary, offer, offer-*
  // - Navigates horizontally through eligible siblings (same parent) ordered by sort
  // - If current page is last (no next), returns only prev, and vice versa
  public static function getChapterNav(Page $page): ?\StdClass {
    if (!self::isChapterNavEligible($page)) return null;


    // Eligible siblings only (same parent)
    $selector = "template=chapter|summary|offer|offer*, status!=hidden, status!=unpublished, sort=sort";
    $prev = $page->prev($selector);
    $next = $page->next($selector);

    $nav = new \StdClass();
    $nav->prev = ($prev && $prev->id) ? self::createRoute($prev) : null;
    $nav->next = ($next && $next->id) ? self::createRoute($next) : null;

    return $nav;
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
