<?php

namespace ProcessWire;

/**
 * @author Bernhard Baumrock, 31.01.2023
 * @license Licensed under MIT
 * @link https://www.baumrock.com
 */
class TextformatterRockDown extends Textformatter
{
  public static function getModuleInfo()
  {
    return [
      'title' => 'Markdown-like Textformatter for Headlines',
      'version' => '1.2.0',
      'summary' => 'ProcessWire Textformatter for simple markdown style text formatting (*bold*, _italic_, ~strike~, ```mono```)',
    ];
  }

  public function format(&$str)
  {
    $start = "(^| )"; // allowed start
    $end = "($|\W)"; // allowed ending whitespace
    $str = preg_replace("/$start\*(.*?)\*$end/", "$1<strong>$2</strong>$3", $str);
    $str = preg_replace("/$start\_(.*?)_$end/", "$1<em>$2</em>$3", $str);
    $str = preg_replace("/$start~(.*?)~$end/", "$1<s>$2</s>$3", $str);
    $str = preg_replace("/$start```(.*?)```$end/", "$1<tt>$2</tt>$3", $str);
    $str = preg_replace("/$start#(.*?)#$end/", "$1<tt>$2</tt>$3", $str);
    $str = $this->replace($str, $start, $end);
  }

  /**
   * Add hookable replace method
   */
  public function ___replace($str, $start, $end)
  {
    return $str;
  }
}
