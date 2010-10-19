---
created_at: 2009-11-11
layout: post
title: "Embedding Github's Gist into Redmine"
author: "Eric Davis"
published: true
categories:
- Home
- Code
- Plugins
---

[Github][] provides a service called [Gist][], where you can share snippets of code or text with others.  What I like about Gist compared to other sites is that you can copy and edit other people's Gists to improve them.  Yasushi Abe wrote a very simple plugin for Redmine that gives Redmine the ability to embed a Gist into the Wiki.  Once it's installed, it's used by calling the `gist` macro with the Gist id like `gist(113685)`.

Here's an example of using it on a wiki page:

[![Gist embedded in an issue](/assets/2009/11/gist-embedded-in-wiki-small.png)](/assets/2009/11/gist-embedded-in-wiki.png)

And another example of using it on an issue's page:

[![Gist embedded in an issue](/assets/2009/11/gist-embedded-in-issue-small.png)](/assets/2009/11/gist-embedded-in-issue.png)

Since the plugin is so short, I'm going to include the entire plugin here.  To install it, just create a directory called `vendor/plugins/redmine_gist` and copy this file into it.

{% highlight ruby%}
### Also available from http://gist.github.com/113685
#
# vendor/plugins/redmine_gist/init.rb
#
require 'redmine'
require 'open-uri'

Redmine::Plugin.register :redmine_gist do
  name 'Redmine Gist embed plugin'
  author 'Yasushi Abe <yasushi.abe@gmail.com>'
  description 'This is a plugin for Redmine'
  version '0.0.1'

  Redmine::WikiFormatting::Macros.register do
    desc "gist embed"
    macro :gist do |obj, args|
      javascript_tag(nil, :src=>"http://gist.github.com/#{args[0]}.js") unless args.empty?
    end

  end
end
{% endhighlight %}

One thing I did discover is that the [Gist][] system doesn't allow sharing private Gists this way.  So you will have to make sure that any Gist you post is public.

Let me know in the comments if you're using this plugin and what you are using it for.

Eric Davis


[Github]: http://github.com
[Gist]: http://gist.github.com
