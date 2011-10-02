--- 
layout: post
title: Sneak peak for deviantArt Widgets 0.2
tags: 
- Development
- News
- plugin
- wordpress
status: publish
type: post
published: true
meta: 
  _edit_last: "2"
  _thumbnail_id: "56"
  jd_tweet_this: "yes"
  Date de prise de vue: sdfsdf
---
Here's a preview of upcomming features for deviantArt Widgets.

While 0.2 release is a matter of weeks, i would like to introduce some of the features i am working on :

 * New shortcodes added to use feeds within your pages 
 * Optimizing thumbnail generation and cache 

### So how it works ?

In a post or page simply add the shorcode with some of the parameters :

    [da_gallery deviant=artgerm items=4]

And this will render this : 

    [da_gallery deviant=artgerm items=4]


Ok... but, like me, you are not a great artist so you prefer to share your favourites instead : 

    [da_favourites deviant=aegypius items=4]

And this will render this : 

    [da_favourites deviant=aegypius items=4]

And what about directly use SitBack Feature instead :

    [da_gallery deviant=artgerm items=4 sitback=flash]

And .... tada ! 

    [da_gallery deviant=artgerm items=4 sitback=flash]


### So what's next ?

I need to do some more code cleanup, css fixtures, controls options, and a admin panel to tweak default options.

For those who wants to try it out (while it's still in early development stage -- call it _alpha_) just download archive <a href="http://github.com/aegypius/wp-da-widgets/zipball/0.2x">@github</a> and install it manually in your wordpress wp-content/plugins/ directory

Please remember that feedback is always welcome but prefer using Issues system <a href="http://github.com/aegypius/wp-da-widgets/issues">@github</a>
