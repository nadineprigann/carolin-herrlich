<?php namespace ProcessWire;

/**
 * Class RepeaterMatrixPage
 *
 * ProcessWire ProFields Repeater Matrix Page, a Page class used by Repeater Matrix items.
 *
 * THIS IS PART OF A COMMERCIAL MODULE: DO NOT DISTRIBUTE.
 * This file should NOT be uploaded to GitHub or available for download on any public site.
 *
 * Copyright 2025 by Ryan Cramer Design, LLC
 * ryan@processwire.com
 *
 * PWPFRMPA
 *
 */

class RepeaterMatrixPageArray extends RepeaterPageArray {

	/**
	 * Return a new repeater matrix item ready for use
	 *
	 * It returns a previously unused RepeaterMatrixPage if it exists. 
	 * Otherwise it creates a new page.
	 * 
	 * The returned page is in a non-hidden published state, so will appear as soon as it is saved.
	 * 
	 * It appends the new item to this RepeaterMatrixPageArray.
	 *
	 * Please note:
	 *
	 * - After making changes to the returned item, you must still save the item.
	 * 
	 * - When finished adding items you must `$page->save()` or `$page->save('repeater_field_name');`
	 *   the page that has this repeater field.
	 * 
	 * - If you don't specify `$type` argument, you should `$item->setMatrixType($type)` afterwards.
	 *
	 * @param int|string $type Optionally specify matrix type (number or name)
	 * @return RepeaterMatrixPage
	 *
	 */
	public function getNewItem($type = null): RepeaterMatrixPage {
		/** @var RepeaterMatrixPage $item */
		$item = parent::getNewItem();
		if($type !== null) $item->setMatrixType($type);
		return $item;
	}
	
	/**
	 * @todo Coming soon
	 *
	 * @param RepeaterMatrixPage $parent
	 * @return PageArray
	 *
	 */
	private function depthChildren(RepeaterMatrixPage $parent): PageArray {
		$items = new PageArray();
		$recording = false;
		$findDepth = $parent->depth+1;
		foreach($this as $item) {
			/** @var RepeaterMatrixPage $item */
			if($item->id === $parent->id) {
				$recording = true;
			} else if($recording) {
				if($item->depth == $findDepth) {
					$items->add($item);
				} else {
					break;
				}
			}
		}
		return $items;
	}

	/**
	 * @todo Coming soon
	 *
	 * @param RepeaterMatrixPage $child
	 * @return null|NullPage
	 *
	 */
	private function depthParent(RepeaterMatrixPage $child) {
		$parent = new NullPage();
		$findDepth = $child->depth-1;
		if($findDepth < 1) return $parent;
		$lastParent = null;
		foreach($this as $item) {
			/** @var RepeaterMatrixPage $item */
			if($item->depth == $findDepth) {
				$lastParent = $item;
			} else if($child->id == $item->id) {
				if($child->depth == ($lastParent->depth+1) && $lastParent) {
					$parent = $lastParent;
					break;
				}
			}
		}
		return $parent;
	}
}