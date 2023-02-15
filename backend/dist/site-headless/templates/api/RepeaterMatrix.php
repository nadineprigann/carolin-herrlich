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
      //   $item->title = $title;
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

      array_push($matrix, $item);
    }

    return $matrix;
  }
}
