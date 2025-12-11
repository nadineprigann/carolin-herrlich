<?php namespace ProcessWire;

class Image {
  public static function get ($image, array $widths = null) {
    $widths = isset($widths) ? $widths : [400, 800, 1200, 1600, 2000];

    if (!$image && !file_exists($image->filename)) return null;

    $response = new \StdClass();
    $response->urls = [];
    $response->description = $image->description;
    // $response->ext = $image->ext;
    $response->ratio = $image->ratio;

    if ($image->ext == 'svg' || $image->ext == 'gif') {
      $response->resized = false;
      $item = new \StdClass();
      $item->url = $image->httpUrl;
      array_push($response->urls, $item);
    } else {
      $response->resized = true;
      // Create image variations
      foreach ($widths as $width) {
        // $resizedImage = $image->width($width);
        $resizedImage = $image->width($width)->webp;
        $item = new \StdClass();
        $item->url = $resizedImage->httpUrl;
        $item->width = $resizedImage->width;
        array_push($response->urls, $item);
      }
    }

    return $response;
  }
}
