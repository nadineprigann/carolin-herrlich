<?php namespace ProcessWire;

class DefaultPage {
  public static function get($data) {
    $requestedLang = Helper::setLanguage();

    if (isset($data->path)) {
      $data->path = trim($data->path, '/');
      $data = AppApiHelper::checkAndSanitizeRequiredParameters($data, ['path|pagePathNameUTF8']);
      // If path equals current language, then just get the homepage. For some reason, ProcessWire does not find the language-related homepage by its path.
      if ($data->path === wire('languages')->getLanguage()->name) {
        $page = wire('pages')->get(1);
      } else {
        // Also find hidden page
        $page = wire('pages')->findOne("path=/$data->path, include=hidden");
      }
    } else {
      // If no path is provided, fall back to homepage
      $page = wire('pages')->get(1);
    }

    // If no page was found, return error page
    if (!($page && $page->id)) {
      $page = wire('pages')->get(27);
    }

    // Prepare cache request
    $namespace = 'app-api';
    $cacheName = implode('-', [$page->id, $requestedLang]);
    $expire = 2630000;
    $omitCache = wire('config')->_omitCache;

    if ($omitCache) {
      // Get fresh data if cache should be omitted
      $cacheData = self::getData($page);
    } else {
      // Check if cache is available
      $cacheData = wire('cache')->getFor($namespace, $cacheName);
      if ($cacheData) {
        // If yes, then unserialize saved cache value
        $cacheData = unserialize($cacheData);
      } else {
        // If no cache available, then create it
        $cacheData = self::getData($page);
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
    $response->meta = Helper::getMeta($page);
    $response->fields = Helper::getFields($page);
    // get page-specific breadcrumbs
    $response->breadcrumbs = Navigation::getBreadcrumbs($page);
    $chapterNav = Navigation::getChapterNav($page);
    if ($chapterNav) {
      $response->nav = $chapterNav;
    }
    // Include children for the following templates
    $includeChildren = ['overview', 'tools', 'blog', 'events', 'projects'];
    if (in_array($page->template->name, $includeChildren)) {
      $response->children = Helper::getPages($page->children);
    }

    // Include categories as categories in response for these templates
    // config-style rules for the templates that should include the categories (filter pages and tools)
    $rules = [
      'overview-tools' => [
        'parent' => 'template=categories',
        'context' => 'template=context, name=werkzeugpalette',
        'extra' => 'is_overview_category=1',
      ],
      'tools' => [
        'parent' => 'template=categories',
        'context' => 'template=context, name=werkzeugpalette',
        'extra' => 'is_overview_category=1',
        ],
      'events' => [
        'parent' => 'template=categories',
        'context' => 'template=context, name=veranstaltung',
      ],
      'blog' => [
        'parent' => 'template=categories',
        'context' => 'template=context, name=blog',
      ],
      // Example: another template using a different context
      // 'template' => [
      //   'parent' => 'template=categories',
      //   'context' => 'template=context, name=xyz',
      // ],
    ];

    $template = $page->template->name;
    // If the template of the current page is listed in the rules, get the categories for this template
    if (isset($rules[$template])) {
      $parent = wire('pages')->get("template=categories");
      // Get the context page defined in the rules for this template
      $contextSelector = $rules[$template]['context'];
      $context = wire('pages')->get($contextSelector);

      // Base selector
      $selectorParts = [
        "template=category",
        "parent_id={$parent->id}",
        "select_context={$context->id}",
      ];

      // Add extra only if it exists
      if (!empty($rules[$template]['extra'])) {
        $selectorParts[] = $rules[$template]['extra'];
      }

      $categories = wire('pages')->find(
        implode(', ', $selectorParts),
        [
          'sort' => 'title',
          'limit' => 1000,
        ]
      );
      $response->categories = Helper::getPages($categories);
    }

    return $response;
  }
}
