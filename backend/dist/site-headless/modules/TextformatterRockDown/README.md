# TextformatterRockDown

ProcessWire Textformatter for simple markdown-like text formatting ideal for headlines:

````
*bold*
_italic_
~strike~
```monospace```
#monospace#
````

This module does intentionally not support full markdown syntax! It is intended to be used for simple formattings that you usually want to apply to headlines.

## Problem

The `title` field is always available in ProcessWire and it is often used for page headlines. But unfortunately when using such a plain textfield it will not be possible to print some words in bold or italic font.

One solution is to create a CKEditor/TinyMCE field, but it's a lot more tedious to setup. Also it's not easy to make it single-line-only.

## Solution

Just apply this textformatter to your field and you'll get quick and easy headlines with bold and italic fonts that will also work with frontend editing.

Backend Editing:

<img src=https://i.imgur.com/sGpqZPO.png width=500>

Frontend Editing:

<img src=https://i.imgur.com/AC36me2.png width=300>

Formatted:

<img src=https://i.imgur.com/KRUjB3z.png width=300>

## Custom tags

You can add custom replacements easily via hook in `/site/ready.php`

```php
$wire->addHookAfter("TextformatterRockDown::replace", function ($event) {
  $str = $event->arguments(0);
  $start = $event->arguments(1);
  $end = $event->arguments(2);
  $str = preg_replace("/$start@(.*?)@$end/", "$1<span style=\"color:red;\">$2</span>$3", $str);
  $event->return = $str;
});
```
