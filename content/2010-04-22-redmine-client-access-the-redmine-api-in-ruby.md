---
created_at: 2010-04-22
layout: post
title: "Redmine Client - Access the Redmine API in Ruby"
author: "Eric Davis"
published: true
categories:
- Home
- Code
---

[Redmine 1.0][1.0] will include a [REST API][api] so I've started to build a Rubygem to make accessing the API in Ruby easy.  So far [redmine_client][] has support for all of the current APIs in Redmine, including:

* Read/write support for Issues
* Read/write support for Projects
* Read support for News

Installation is an easy `gem install redmine_client` and it's used just like [ActiveResource][].  For example to change Issue [#19000][] on the demo.redmine.org site using the "bob" user:

{% highlight 'ruby' %}
require 'rubygems'
require 'redmine_client'

RedmineClient::Base.configure do
  self.site = 'http://demo.redmine.org'
  self.user = 'bob'
  self.password = 'somepassword'
end

issue = RedmineClient::Issue.find(19000)
issue.subject = "Changed via the API"
issue.save

{% endhighlight %}

Both the Redmine API and the [redmine_client][] are under development so I'll be adding new features over the next few months up to Redmine 1.0.  Feel free to [fork the project on Github][github] and hack away at it.

[redmine_client]: http://rubygems.org/gems/redmine_client
[github]: http://github.com/edavis10/redmine_client
[ActiveResource]: http://api.rubyonrails.org/classes/ActiveResource/Base.html
[1.0]: http://www.redmine.org/versions/show/14
[api]: http://www.redmine.org/issues/296
[#19000]: http://demo.redmine.org/issues/19000
