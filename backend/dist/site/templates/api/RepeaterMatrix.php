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
           $select = $matrixItem->select_accordion;
          // NOTE: I do not use getPage as I want a flatter hierarchy in the frontend. Therefore, I only use the fields of the accordion page not the page itself

          // Page reference always returns PageArray, so we need to fetch the first page item (backend is configured to only allow for one page to be selected, so this is safe) within it to make it work within getPageFields as it expects a single page.
          $page = $select instanceof PageArray ? $select->first() : null;

          // assign this fetched page to the accordion field if it exists otherwise return null
          $item->accordion = $page
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
