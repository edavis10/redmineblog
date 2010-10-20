---
created_at: 2010-07-20
kind: article
title: "Redmine 1.0 Feature: Caching Text Formatting"
author: "Eric Davis"
published: true
categories:
- Home
- Community
- Code
---

One of the new features included in [Redmine 1.0][1.0] is the ability to cache the text formatting.  Each time Redmine displays any text markup, like Textile, it has to run the text through a conversion process to get HTML.  This means that an issue with 30 comments will run this conversion runs 31 times, once for the issue description and once for each comment.

The Cache Text Formatting feature will take the results of that conversion and save it so the next time that HTML is needed, the conversions can be skipped.  By default this is off but it can be turned on by in the Administration Settings with the option "Cache formatted text".

![Cache Formatted Text Setting](http://redmineblog.com/assets/2010/7/cache_formatted_text.png)

It uses Ruby on Rails' [MemoryStore][] for caching.  This will save the cached data to the memory of the running Ruby process.  But it can replaced with any other [Cache Store][].  For example, I [just setup][] a [memcached][] cache for [demo.redmine.org][] using the following configuration:

{% highlight 'ruby' %}
# config/additional_environment.rb
#
config.gem 'memcached' # For other hosts
# config.gem 'memcached-northscale', :lib => 'memcached' # For Heroku.com
require 'memcached'
config.cache_store = :mem_cache_store, ::Memcached::Rails.new
{% endhighlight %}

If you are interested in more details about this feature, checkout issue [#4482][] and my [blog post][theadmin] where I went through how the text formatting works in more detail.

[just setup]: http://github.com/edavis10/redmine_branches/commit/b9c2635dba1d55fbe4e86f568329714f9d9df77b
[1.0]: http://redmineblog.com/articles/redmine-1.0.0-released
[memcached]: http://memcached.org/
[#4482]: http://www.redmine.org/issues/4482
[MemoryStore]: http://guides.rubyonrails.org/caching_with_rails.html
[Cache Store]: http://guides.rubyonrails.org/caching_with_rails.html#cache-stores
[demo.redmine.org]: http://demo.redmine.org
[theadmin]: http://theadmin.org/articles/2010/07/13/daily-code-reading-redmine-wiki-formatting/
