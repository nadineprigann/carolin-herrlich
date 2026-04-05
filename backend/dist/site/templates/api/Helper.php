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

    // whitelist templates for which archive status should be returned
    $hasArchive = ['blog-post', 'event'];

    if (in_array($page->template->name, $hasArchive)) {
      $response->archived = self::isArchived($page);
    }
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
        $pdata[$field->name] = self::formatPlainText($value);
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
        // choose parser by field name (or pattern)
        $pdata[$field->name] = ($field->name === 'context')
          ? self::getNumberTable($value)
          : self::getTable($value);
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
        'title' => self::formatPlainText($p->title)
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
      $item = self::getFields($p);

      // whenever select_page and select_host BOTH are set (currently is the case for fields in_depth and custom_links which are both repeaters), override the URL of select_page with the URL of select_host + anchor to select_page. this is necessary for accordion links as they come with accordions/xxx by default and would link to this non-existing URL on the frontend. with this override, the accordion links will link to the correct page + anchor on the frontend. implemented in all ocurrences of select_page, therefore also in home_slide in RepeaterMatrix.php
      if (isset($item['select_page']) && isset($item['select_host'])) {

        $page = $p->select_page; // raw Page object
        $host = $p->select_host;

        if ($page && $page->id) {

          // override URL if accordion
          if ($page->template->name === 'accordion' && $host && $host->id) {

            // select_page is already transformed → override it
            if (is_array($item['select_page'])) {
              foreach ($item['select_page'] as &$link) {
                $link->meta->url =
                  rtrim($host->url, '/') . '/#' . $page->name;
              }
            } else {
              $item['select_page']->meta->url =
                rtrim($host->url, '/') . '/#' . $page->name;
            }
          }
        }
      }

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
      'title' => self::formatPlainText($page->title)
    ];
    return $item;
  }

  // TODO: check if multiple items or single
  public static function getSelectOptions($field) {
    return [
      'id' => $field->id,
      'title' => self::formatPlainText($field->title),
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
    $item->description = self::formatPlainText($file->description);
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
        'key' => self::formatText($row->title), // use formatText here instead of formatPlain text cuz these fields are based on the text field in PW and therefore use its settings -> rich text!
        // 'key' => self::formatText($row->table_key),
        'value' => self::formatText($row->value)
        // 'value' => self::formatText($row->table_value)
      ];
      array_push($array, $item);
    }
    return $array;
  }

  public static function getNumberTable($field) {
    $array = [];
    if (!$field) return $array;
    // TODO: make code more universal by looking up columns dynamically
    // $columns = $field->columns;
    foreach ($field as $row) {
      $item = [
        'number' => self::formatText($row->number), // use formatText here instead of formatPlain text cuz these fields are based on the text field in PW and therefore use its settings -> rich text!
        // 'key' => self::formatText($row->table_key),
        'text' => self::formatText($row->text)
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
    // $field = wire('sanitizer')->purify($field);
    $field = wire('sanitizer')->unentities($field);

    // always add target="_blank" and rel="noopener noreferrer" to external links in text fields to make sure that any link set via the backend in a text field opens in a new browsing context. checked for already existing target and rel attributes to not override manually added ones, but add missing values if necessary.
    $field = preg_replace_callback('/<a([^>]*href="([^"]+)"[^>]*)>/i', function($matches) {
      $attrs = $matches[1];
      $href = $matches[2];

      // skip internal links
      if (
        str_starts_with($href, '/') ||
        strpos($href, wire('config')->httpHost) !== false
      ) {
        return '<a' . $attrs . '>';
      }

      // add target if missing
      if (stripos($attrs, 'target=') === false) {
        $attrs .= ' target="_blank"';
      }

      // ensure rel contains noopener noreferrer
      if (stripos($attrs, 'rel=') === false) {
        $attrs .= ' rel="noopener noreferrer"';
      } else {
        $attrs = preg_replace_callback('/rel="([^"]*)"/i', function($relMatch) {
          $rels = $relMatch[1];

          if (stripos($rels, 'noopener') === false) {
            $rels .= ' noopener';
          }
          if (stripos($rels, 'noreferrer') === false) {
            $rels .= ' noreferrer';
          }

          return 'rel="' . trim($rels) . '"';
        }, $attrs);
      }

      return '<a' . $attrs . '>';
    }, $field);

    return $field;
  }

  public static function formatPlainText($value) {
    // Decode repeatedly until stable (handles double encoding)
    do {
      $decoded = html_entity_decode($value, ENT_QUOTES | ENT_HTML5, 'UTF-8'); // decode HTML entities like &, <, >, umlauts etc. to get the actual plain text value
      if ($decoded === $value) break; // if decoding doesn't change the value, we're done = plain text that cannot be decoded further
      $value = $decoded; // otherwise, continue decoding
    } while (true); // always decode at least once, then check if further decoding is needed. can cause infinite loop if the value is not properly encoded. but risk is as encoding is controlled by backend and we do break after stable state is reached.
    return $value;
  }

  public static function isArchived($page) {
      // determine if a page is archived based on its template and relevant date fields. The logic can be adjusted based on specific requirements for each template.
      switch ($page->template->name) {
      case 'blog-post':
        return $page->is_archived == 1 || $page->created < strtotime('-6 months');

      // case 'event':
      //   return $page->event_date < time();

      default:
        return false;
    }
  }
}
