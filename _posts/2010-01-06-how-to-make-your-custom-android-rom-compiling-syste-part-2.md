--- 
layout: post
title: How to make your custom Android ROM - Compiling the system (part 2)
tags: 
- android
- Development
- how-to
status: publish
type: post
published: true
meta: 
  _edit_last: "2"
  thumb: http://www.aegypius.com/wp-content/uploads/2009/12/android_logo.jpg
  jd_tweet_this: "yes"
  wp_jd_target: http://www.aegypius.com/2010/01/how-to-make-your-custom-android-rom-the-compilation-part-2/
  wp_jd_bitly: http://bit.ly/6flOpD
  _wp_old_slug: how-to-make-your-custom-android-rom-the-compilation-part-2
  _thumbnail_id: "42"
---

### Part 2 - The Compilation

This post is more generic than the previous one, every linux may work :

Let's get the sources, Google uses a tool called "repo" so you need first to get this tool.

~~~ {bash}
    mkdir ~/bin
    cat >> ~/.bashrc
    # set PATH so it includes user's private bin if it exists
    if [ -d ~/bin ] ; then
      PATH=~/bin:"${PATH}"
    fi
~~~
~~~ {bash}
    source ~/.bash_profile
~~~

This step allow you to have your own bin directory so you don't mess your system with binaries that are not managed by emerge.

~~~ {bash}
    curl http://android.git.kernel.org/repo >> ~/bin/repo
    chmod a+x ~/bin/repo
~~~

Let's try :

~~~ {bash}
    repo --version
    repo version v1.6.8.8
            (from git://android.git.kernel.org/tools/repo.git)
    git version 1.6.5.6
    Python 2.6.4 (r264:75706, Dec  7 2009, 12:35:13)
    [GCC 4.1.2 (Gentoo 4.1.2 p1.3)]
~~~

Now we will initialize android repository.

~~~ {bash}
    mkdir -p ~/src/android
    cd ~/src/android
    repo init -u git://android.git.kernel.org/platform/manifest.git -b donut
~~~

After a while you will be able to synchronize your repository

~~~ {bash}
    repo sync
    export ANDROID_JAVA_HOME=$JAVA_HOME
    make
~~~

Now compile is running ...

272 minutes later, compilation completed  (on my AMD Athlon XP 3200+) !

In the next part we will test our fresh build !

See You !
