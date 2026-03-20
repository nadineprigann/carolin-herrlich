<?php namespace ProcessWire;

require_once __DIR__ . '/Images.php';

class RepeaterMatrix {
  public static function get($fieldValue) {
    $matrix = [];

    foreach ($fieldValue as $matrixItem) {
      $item = new \StdClass();
      $item->type = $matrixItem->type;

      // $page = $matrixItem->getForPage();

      // if ($matrixItem->type === 'type_section') {
      //   $title = $matrixItem->title;
      //   if (!$title) continue;
      //   $item->title = Helper::formatText($title)
      // }

      if ($matrixItem->type === 'type_text') {
        $text = $matrixItem->text;
        if (!$text) continue;
        $item->text = Helper::formatText($text);
      }

      if ($matrixItem->type === 'type_images') {
        $images = $matrixItem->images;
        if (!$images->count) continue;
        $item->images = Images::get($images);
      }

      if ($matrixItem->type === 'type_slider') {
        $images = $matrixItem->images;
        if (!$images->count) continue;
        $item->images = Images::get($images);
      }

      if ($matrixItem->type === 'type_accordion') {
        $page = $matrixItem->select_accordion;

        // NullPage has id = 0
        $item->accordion = $page->id
          ? Helper::getPageFields($page)
          : null;
      }

      if ($matrixItem->type === 'type_table') {
        $item->title = Helper::formatText($matrixItem->title);

        $table = $matrixItem->table;
        if (!$table || !count($table)) continue;
        $item->table = Helper::getTable($table);
      }

      if ($matrixItem->type === 'type_home_slide') {
        $item->title = Helper::formatText($matrixItem->title);
        $item->date_start = Helper::formatText($matrixItem->date_start);
        $item->date_end = Helper::formatText($matrixItem->date_end);
        $item->text = Helper::formatText($matrixItem->text);
        $item->image = Images::get($matrixItem->image);
        $item->categories = Helper::getPageReferences($matrixItem->select_category);
        $item->link = Helper::getPageReference($matrixItem->select_page);


        // whenever select_page and select_host BOTH are set, override the URL of select_page with the URL of select_host + anchor to select_page. this is necessary for accordion links as they come with accordions/xxx by default and would link to this non-existing URL on the frontend. with this override, the accordion links will link to the correct page + anchor on the frontend. implemented in all ocurrences of select_page, therefore also in fields in_depth and custom_links (both repeaters) in getRepeaters() in Helper.php
        $page = $matrixItem->select_page;
        $host = $matrixItem->select_host; // your new field

        if ($page && $page->id) {

          $item->link = Helper::getPageReference($page);

          if ($page->template->name === 'accordion' && $host && $host->id) {
            $item->link->meta->url =
              rtrim($host->url, '/') . '/#' . $page->name;
          }

        } else {
          $item->link = null;
        }
      }

      // if ($matrixItem->type === 'type_image') {
      //   $image = $matrixItem->image;
      //   if (!$image) continue;
      //   $item->image = Images::get($image);
      // }

      // if ($matrixItem->type === 'type_list') {
      //   $list = $matrixItem->list;
      //   if (!$list->count) continue;
      //   $item->list = Helper::getRepeater($list);
      // }

      // if ($matrixItem->type === 'type_video') {
      //   $media_id = $matrixItem->media_id;
      //   if (!$media_id) continue;
      //   $item->media_id = $media_id;
      // }

       if ($matrixItem->type === 'type_button') {
        $button_title = $matrixItem->external_link_title;
        if (!$button_title) continue;
        $item->button_title = Helper::formatText($button_title);
      }

      array_push($matrix, $item);
    }

    return $matrix;
  }
}
