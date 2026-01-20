<?php namespace ProcessWire;

if(!defined("PROCESSWIRE")) die();

/** @var ProcessWire $wire */

/**
 * ProcessWire Bootstrap API Ready
 * ===============================
 * This ready.php file is called during ProcessWire bootstrap initialization process.
 * This occurs after the current page has been determined and the API is fully ready
 * to use, but before the current page has started rendering. This file receives a
 * copy of all ProcessWire API variables.
 *
 */

// Clear all AppApi caches when a page is saved
$pages->addHookAfter('saveReady', function($event) {
  $deleted = wire('cache')->deleteFor('app-api');
  if ($deleted && wire('config')->debug) wire('log')->save('app-api', 'cache deleted');
});

// Set CORS headers for API request
$this->addHookBefore('Router::setCorsHeaders', function($event) {
  $event->replace = true;
  $server = wire('config')->_frontendUrl;
  header("Access-Control-Allow-Origin: {$server}");
  header('Access-Control-Allow-Headers: Content-Type, AUTHORIZATION, X-API-KEY');
  header('Access-Control-Allow-Credentials: true');
});

// Adjust "View site" link in user navigation if a frontend URL has been set in config.php
if (wire()->config->_frontendUrl) {
  wire()->addHookAfter('AdminThemeFramework::getUserNavArray', function($event) {
    $value = $event->return;
    $viewSite = array_search(wire()->urls->root, $value);
    $value[$viewSite]['url'] = wire()->config->_frontendUrl;
    $event->return = $value;
  });
}

/**
 * Restrict selectable categories in Page Reference fields based on the template of the page being edited as well as mapped contextsthat are associated with each category.
 *
 * This hook runs when ProcessWire determines which pages
 * are selectable for an InputfieldPage (Page Reference).
 */
$wire->addHookAfter('InputfieldPage::getSelectablePages', function($event) {
  $input = $event->object;
  $page  = $input->hasPage;

  // only apply this hook to the field "select_category" when editing a page.
  $field = $event->object->hasField;
  if(!$field || $field->name !== 'select_category') return;
  if(!$page) return;

  // map templates to contexts (context template). each category as well as the template that holds the field is assigned to a context. when new categories in different contexts are needed, just map them here.
  $map = [
    'tool'  => 'werkzeugpalette',
    'event' => 'veranstaltung',
    // 'shop' => 'shop',
  ];

  $tpl = $page->template->name;
  if(!isset($map[$tpl])) return;

  // resolve the context page dynamically.
  $context = wire('pages')->get("template=context, name={$map[$tpl]}");
  if(!$context->id) return;

  // Override the selectable pages for this field. Only category pages:
   // - using the correct category template
   // - referencing the resolved context
   // This replaces the default selectable PageArray.
  $event->return = $event->pages->find(
    "template=category, select_context=$context"
  );
});

// On-demand mirroring of remote files to local environment
// wire()->addHookAfter('Pagefile::url', null, 'mirrorFiles');
// wire()->addHookAfter('Pagefile::filename', null, 'mirrorFiles');
// function mirrorFiles($event) {
//   $config = $event->wire('config');
//   $file = $event->return;

//   if (!$config->_productionBackendUrl) return;

//   // TODO: method is too generic, as it affects e.g. also DB dump uploads
//   if ($event->method == 'url') {
//     // Convert url to disk path
//     $file = $config->paths->root . substr($file, strlen($config->urls->root));
//   }

//   if (!file_exists($file)) {
//     // Download file from source if it doesn't exist locally
//     $src = $config->_productionBackendUrl . '/site/assets/files/';
//     $url = str_replace($config->paths->files, $src, $file);
//     $http = new WireHttp();
//     $http->download($url, $file);
//   }
// }
