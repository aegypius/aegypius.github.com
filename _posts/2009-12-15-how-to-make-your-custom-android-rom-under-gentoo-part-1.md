--- 
layout: post
title: How to make your custom Android ROM - The Prerequisites (part 1)
categories:
tags: 
- wordpress
- android
- Development
- gentoo
- how-to
status: publish
type: post
published: true
meta: 
  jd_tweet_this: "yes"
  _edit_last: "2"
  wp_jd_target: http://www.aegypius.com/2009/12/how-to-make-your-custom-android-rom-under-gentoo-part-1/
  wp_jd_bitly: http://bit.ly/6vx8xD
  wp_short: http://wp.me/pyvUI-18
  thumb: http://www.aegypius.com/wp-content/uploads/2009/12/android_logo.jpg
  _thumbnail_id: "42"
---
First of all, this is an experiment tutorial explaining how i complete compilation of Android source on a gentoo. The purpose of this serie of article is to provide a step-by-step way to create your own custom ROM for android.

I own a HTC Magic 32B (Google branded) so the tests i will perform is intended to work on this specific platform.

As you know, it can be risky to modify your Android ROM with a custom one. You're warn ! I am not responsible of possible deterioration of your terminal !

So, let's begin !

### Part 1 - The Prerequisites (for Gentoo)

You may read the Official documentation located here : [http://source.android.com/download](http://source.android.com/download).

Let's start with dependencies installation,

~~~ {bash}
    emerge git gnupg
    emerge "<dev-java/sun-jdk-1.6"
    emerge flex bison gperf libsdl esound wxGTK
    emerge zip unzip curl zlib readline
~~~

Android does not compile with JDK-1.6 so we have merged a JDK-1.5, let's configure your system to use it.

~~~ {bash}
    eselect java-vm list
      [1]   sun-jdk-1.5
      [2]   sun-jdk-1.6  system-vm
    eselect java-vm set user sun-jdk-1.5
~~~

or

~~~ {bash}
    eselect java-vm set user 1
~~~

Now you need to refresh your environment :

~~~ {bash}
    sudo env-update && source /etc/profile
~~~

Environment is now ready let's try to compile android system : [Part 2 - Compiling the system](http://wp.me/pyvUI-18)
