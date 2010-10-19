---
created_at: 2009-09-23
layout: post
title: "Rails 2.3.4 Support"
author: "Eric Davis"
published: true
categories:
- Home
- Code
---
Recently [Redmine was upgraded][2.3.4] to run on the latest version of Ruby on Rails, 2.3.4.  Redmine has been running on older versions of Ruby on Rails, 2.2.2 in trunk and 2.1.2 in 0.8.x.  This upgrade will also allow us to take advantage of new Ruby on Rails APIs and third party code.  I was able to fix the major bugs during the upgrade but like any other major change, there will be a few small bugs that appear over the next few weeks.

If you are able to run Redmine in a test environment, please upgrade to the latest trunk and let us know about any bugs or odd behavior you find.  If you can troubleshoot the bug and are able to provide a patch, that would be awesome.

With this upgrade complete, I'm going to focus my energy into building the [REST API][] for Redmine.  I'm hoping to build out the authentication part first so plugin developers will be able to add their own APIs.  If you have an idea of what you'd like to use a Redmine API for, please comment on the [API ideas][] forum thread I've posted.

[REST API]: http://www.redmine.org/issues/296
[API ideas]: http://www.redmine.org/boards/1/topics/8746
[3597]: http://www.redmine.org/issues/3597
[2.3.4]: http://www.redmine.org/news/28
