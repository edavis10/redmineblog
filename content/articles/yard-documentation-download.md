---
created_at: 2010-04-10
kind: article
title: "YARD - Local Redmine Documentation Download"
author: "Eric Davis"
published: true
categories:
- Home
- Code
---

![YARD Logo](http://redmineblog.com/assets/2010/4/yard-logo.png)

Redmine has a large codebase and sometimes it's hard to find the class or method that you need for your custom development.  Since I recently added support to Redmine for [YARD][] (a powerful Ruby documentation tool) I figured that I'd post the generated documentation here.

[YARD][] generates HTML documentation from Redmine's code comments, so it's fully automatic.  I like YARD over RDoc because it has a better design and has a JavaScript search builtin.

To install, just extract one of these zip files and open the `index.html` in a web browser. Instant local documentation!

* [Redmine YARD documentation from trunk at r3631][redmine-only]
* [Redmine YARD documentation from trunk at r3631 with Ruby on Rails 2.3.5][redmine-with-rails]

If you want to regenerate the documentation from your Redmine, just install the [YARD][] gem (`gem install yard`) and run `rake yard` while in the Redmine root directory.

If you want to improve the documentation or code comments, feel free to submit a patch to [Redmine](http://www.redmine.org) and we will integrate it into the core.

[YARD]: http://yardoc.org/
[redmine-only]: http://redmineblog.com/assets/2010/4/redmine-yard-doc-r3631.zip
[redmine-with-rails]: http://redmineblog.com/assets/2010/4/redmine-yard-doc-r3631-with-rails.zip
