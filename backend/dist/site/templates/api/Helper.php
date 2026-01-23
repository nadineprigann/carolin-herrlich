<?php namespace ProcessWire;

require_once __DIR__ . '/Images.php';
require_once __DIR__ . '/RepeaterMatrix.php';

class Helper {
  public static function setLanguage() {
    if (!isset($_SERVER['HTTP_X_API_LANGUAGE'])) {
      throw new AppApiException("Required header X-API-Language is missing", 400);
    }

    // Only use first two characters of API LANGUAGE in case the browser wrongly sends multiple languagues
    $acceptLanguage = substr($_SERVER['HTTP_X_API_LANGUAGE'], 0, 2);

    // Sanitize truncated value
    $requestedLang = wire('sanitizer')->selectorValue($acceptLanguage);

    // Check if requested language is default language (as its name is always 'default')
    $requestedLang = $requestedLang == wire('config')->_defaultLanguage ? 'default' : $requestedLang;

    // Get language
    $lang = wire('languages')->getLanguage($requestedLang);

    // Throw error if language couldn’t be found
    if (!($lang && $lang->id)) {
      throw new AppApiException("Requested language '$requestedLang' not available", 400);
    }

    // Set language
    wire('languages')->setLanguage($lang);
    wire('languages')->setLocale();

    return $requestedLang;
  }

  public static function unsetLanguage() {
    // Recall previous language
    wire('languages')->unsetLanguage();
    wire('languages')->setLocale();
  }

  public static function getMeta($page) {
    $page->of(true);
    $response = new \StdClass();
    $response->id = $page->id;
    $response->name = $page->name;
    $response->url = $page->url;
    $response->template = $page->template->name;
    $response->alternate = self::getAlternate($page);
    return $response;
  }

  public static function getAlternate($page) {
    $languageSupportPageNames = wire('modules')->isInstalled('LanguageSupportPageNames');
    $alternates = [];

    if (!$languageSupportPageNames) return $alternates;

    $defaultLanguage = wire('config')->_defaultLanguage;
    $availableLanguages = wire('config')->_availableLanguages;

    foreach (wire('languages') as $lang) {
      $l = $lang->isDefault() ? $defaultLanguage : $lang->name;

      // Check if language is listed in PW config
      if (!in_array($l, $availableLanguages)) continue;

      $alternates[] = array(
        'url' => $languageSupportPageNames ? $page->localUrl($lang) : $page->url,
        'lang' => $l
      );
    }

    return $alternates;
  }

  public static function getFields($page, array $exclude = null) {
    $page->of(true);
    $pdata = [];
    foreach ($page->template->fieldgroup as $field) {
      // Skip the following fields
      if (is_array($exclude) && in_array($field->name, $exclude)) continue;
      if ($field->type instanceof FieldtypeFieldsetOpen) continue;
      if ($field->name == 'pdfs') continue;
      if ($field->name == 'files') continue;

      $value = $page->get($field->name);

      if ($field->type instanceof FieldtypePageTitle) {
        $pdata[$field->name] = self::formatText($value);
        continue;
      }

      if ($field->type instanceof FieldtypeImage) {
        $pdata[$field->name] = Images::get($value);
        continue;
      };

      if ($field->type instanceof FieldtypeFile) {
        $pdata[$field->name] = self::getFiles($value);
        continue;
      }

      if ($field->type instanceof FieldtypePage) {
        $pdata[$field->name] = self::getPageReferences($value);
        continue;
      }

      if ($field->type instanceof FieldtypeOptions) {
        $pdata[$field->name] = self::getSelectOptions($value);
        continue;
      }

      if ($field->type instanceof FieldtypeRepeaterMatrix) {
        $pdata[$field->name] = RepeaterMatrix::get($value);
        continue;
      }

      if ($field->type instanceof FieldtypeRepeater) {
        $pdata[$field->name] = self::getRepeater($value);
        continue;
      }

      if ($field->type instanceof FieldtypeTextarea) {
        $pdata[$field->name] = self::formatText($value);
        continue;
      }

      if ($field->type instanceof FieldtypeDatetime) {
        $pdata[$field->name] = self::getDatetime($page, $field);
        continue;
      }

      if ($field->type instanceof FieldtypeTable) {
        $pdata[$field->name] = self::getTable($value);
        continue;
      }

      if ($field->type instanceof FieldtypeCheckbox) {
        $pdata[$field->name] = $value === 1 ? true : false;
        continue;
      }

      // TODO: Why do we have to turn of output formatting to (sometimes) get the sleepValue?
      // $page->of(false);
      $v = $field->type->sleepValue($page, $field, $value);

      // Remove entities (added by HTML Entity Encoder)
      $vu = wire('sanitizer')->unentities($v);

      $pdata[$field->name] = $vu;
    }

    return $pdata;
  }

  public static function getPages($pages, bool $recursive = false, array $exclude = null, $returnArray = true) {
    if ($pages instanceof PageArray) {
      $response = [];
      foreach ($pages as $p) {
        $item = self::getPage($p, $recursive, $exclude);
        array_push($response, $item);
      }
      return $response;
    } else if ($pages instanceof Page) {
      $p = self::getPage($pages, $recursive, $exclude);
      if ($returnArray) {
        return array($p);
      } else {
        return $p;
      }
    } else {
      return [];
    }
  }

  public static function getPage($page, bool $recursive = false, array $exclude = null) {
    // $p->of(true);
    $item = new \StdClass();
    $item->meta = self::getMeta($page);
    $item->fields = self::getFields($page, $exclude);
    // $item->parent = self::getMeta($page->parent);
    if ($recursive && $page->hasChildren) {
      $item->children = self::getPages($page->children, $recursive, $exclude);
    }
    return $item;
  }

  public static function getPageFields(Page $page) {
    $page->of(true);
    // return all the fields of the passed page object.
    return self::getFields($page);
  }

  public static function getParents($page, $selector = 'template!=home', $returnArray = true) {
    $pages = $page->parents($selector);
    $array = [];
    if (!($pages && $pages->count)) return $array;
    foreach ($pages as $p) {
      $p->of(true);
      $item = new \StdClass();
      $item->meta = self::getMeta($p);
      $item->fields = [
        'title' => $p->title
      ];
      array_push($array, $item);
    }
    return $array;
  }

  public static function getRepeater($pages) {
    $array = [];
    if (!$pages) return $array;
    foreach ($pages as $p) {
      $p->of(true);
      // $item = new \StdClass();
      // $item->meta = self::getMeta($p);
      // $item->fields = self::getFields($p);
      $item = self::getFields($p);
      array_push($array, $item);
    }
    return $array;
  }


  public static function getPageReferences($pages) {
    if ($pages instanceof PageArray) {
      $response = [];
      foreach ($pages as $p) {
        $item = self::getPageReference($p);
        array_push($response, $item);
      }
      return $response;
    } else if ($pages instanceof Page) {
      return self::getPageReference($pages);
    }
  }

  public static function getPageReference($page) {
    if (!($page && $page->id)) return null;
    // $p->of(true);
    $item = new \StdClass();
    $item->meta = self::getMeta($page);
    $item->fields = [
      'title' => $page->title
    ];
    return $item;
  }

  // TODO: check if multiple items or single
  public static function getSelectOptions($field) {
    return [
      'id' => $field->id,
      'title' => $field->title,
      'value' => $field->value
    ];
  }

  public static function getFiles($field) {
    if ($field instanceof Pagefiles) {
      $response = [];
      foreach ($field as $f) {
        $item = self::getFile($f);
        array_push($response, $item);
      }
      return $response;
    } else if ($field && $field instanceof Pagefile) {
      return self::getFile($field);
    }
  }

  public static function getFile($file) {
    // $p->of(true);
    $item = new \StdClass();
    $item->ext = $file->ext;
    $item->description = $file->description;
    $item->url = $file->httpUrl;
    return $item;
  }

  public static function getTable($field) {
    $array = [];
    if (!$field) return $array;
    // TODO: make code more universal by looking up columns dynamically
    // $columns = $field->columns;
    foreach ($field as $row) {
      $item = [
        'key' => self::formatText($row->title),
        // 'key' => self::formatText($row->table_key),
        'value' => self::formatText($row->value)
        // 'value' => self::formatText($row->table_value)
      ];
      array_push($array, $item);
    }
    return $array;
  }

  public static function getDatetime($page, $field) {
    $timestamp = intval($page->getUnformatted($field->name));
    if (!$timestamp) return null;
    // Reference: https://unicode-org.github.io/icu/userguide/format_parse/datetime/
    $fmt = new \IntlDateFormatter(wire('languages')->getLocale(), \IntlDateFormatter::FULL, \IntlDateFormatter::FULL);
    $fmt->setPattern("d.M.YYYY");
    $date = $fmt->format($timestamp);
    $fmt->setPattern("HH:mm");
    $time = $fmt->format($timestamp);
    return [
      'formatted' => [
        'date' => $date,
        'time' => $time,
      ],
      'iso' => date('c', $timestamp),
      // 'dst' => date('I', $timestamp),
      // 'timestamp' => $timestamp
    ];
  }

  public static function formatText($field) {
    // Replace -- and --- in text fields with soft hyphen and zero-width space respectively
    $field = str_replace("---", "&#8203;", $field);
    $field = str_replace("--", "&shy;", $field);

    // Convert relative (backend) paths to absolute paths (so that they work on the frontend too)
    $field = str_replace('/site/assets/files/', wire('config')->urls->httpRoot . 'site/assets/files/', $field);

    // Remove entities (added by HTML Entity Encoder)
    $field = wire('sanitizer')->unentities($field);
    $field = wire('sanitizer')->purify($field);

    return $field;
  }
}
