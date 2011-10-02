--- 
layout: post
title: deviantART widgets plugin for Wordpress
tags: 
- Development
- plugin
- wordpress
status: publish
type: post
published: true
meta: 
  jd_tweet_this: "yes"
  _edit_last: "2"
  thumb: http://www.aegypius.com/wp-content/uploads/2009/12/deviantart-widgets.jpg
  wp_jd_bitly: http://bit.ly/4J3Bdd
  wp_jd_target: http://www.aegypius.com/2009/12/deviantart-widgets-plugin-for-wordpress/
  _thumbnail_id: "56"
---
This is the end of the sad "text-only" sidebars ! This plugin allows to display deviantART feeds into your WordPress blog.

### What's this ?
After some infructuous searches, I started to develop this plugin for myself to help me share my interest on graphism and art in general.

So here it is ! You can now promote your favorites artists, your art or simply your journal into your blog.

### Built-in Features

 *  Supports Favourites, Galleries and Journal Feeds
 *  Cache management to preserve performance and bandwidth consumption
 *  Thumbnail generation
 *  Unlimited number of widgets
 *  And more to come ...

### Prerequisites, Downloads
#### Requirements

 * WordPress 2.8 or greater.
 * PHP 5 with curl

#### Downloads
You call go to WordPress hosted site at : <a href="http://wordpress.org/extend/plugins/deviantart-widgets/">http://wordpress.org/extend/plugins/deviantart-widgets/</a> to download stables versions. You can also use the builtin plugin installer provided with WordPress or use <a title="deviantART github downloads" href="http://github.com/aegypius/wp-da-widgets/downloads" target="_blank">github/downloads</a> to get pre-releases (advanced users only).

### Source
Source code is managed on <a title="deviantART git repository" href="http://github.com/aegypius/wp-da-widgets" target="_blank">github/source</a>, feel free to check it out !

### Updates
#### Version 0.1.5

 *  Issue #1: Fixed
 *  Added an option to enable debugging in global options
 *  Added the possibility to customize CSS styles for the widget in global options
 *  Fixing locale calls to allow string translation in differents languages (help granted !)

#### Version 0.1.4

 *  Issue #1 : Adding an "Empty cache" button to clean the plugin cache
 *  Issue #1 : Adding more tests to check if the plugin is usable
 *  Issue #1 : Updating thumbnail generation for Gallery mode

#### Version 0.1.3

 *  Issue #1: Safe Mode problem
 *  Prevents "litteratures" to show in Favourites and Galleries

#### Version 0.1.2

 *  Changing readme.txt tags
 *  Fixing cache issues when wp-content/cache is not writeable.

#### Version 0.1.1

 *  Removes useless settings
 *  Fix url to thumbnails to uses Wordpress url instead of absolute one

#### Version 0.1

 *  Initial release
 *  Cache support (default: wp-content/cache)
 *  Thumbnails generation support (default: 80x80/png)
 *  Supports deviantArt Journals, Galleries and Favourites


### Support
Found an issue ? Please report it on <a title="deviantART widgets issue tracker" href="http://github.com/aegypius/wp-da-widgets/issues" target="_blank">github/issues</a>
