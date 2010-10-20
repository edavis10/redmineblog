---
created_at: 2010-01-30
kind: article
title: "Redmine 0.9 officially released"
author: "Eric Davis"
published: true
categories:
- Home
- Community
---

Jean-Philippe just posted the [official 0.9 release][release] of Redmine to the servers.  This is the first official release of the Redmine 0.9 branch that has been under development since December 2008.  It includes over 269 new features and bug fixes.  You can find the entire list of changes on the [0.9.0][] and [0.9.1][] roadmaps but here are some of my favorites:

* [Asynchronous email delivery][#613] - can really speed up email delivery, which I written about [before][async email]
* [Browse through Git branches][#1406]
* [Copy A Project][#886]
* [REST API for authentication][#3920]
* [Rails 2.3.4 support][#3597] - it's actually 2.3.5 now but this opened up so many more API methods for Redmine plugins
* [Remove email body via a delimiter][#4409]
* [Set session store to cookie store by default][#2628] - this means no more 1000s of ruby_session files in /tmp
* [Unlimited subproject nesting][#594]
* [User groups][#1018]

What are your favorite new features?  What are you wanting to get added to the next major release of Redmine?

[release]: http://www.redmine.org/news/33
[0.9.0]: http://www.redmine.org/versions/show/6
[0.9.1]: http://www.redmine.org/versions/show/15
[async email]: http://redmineblog.com/articles/asynchronous-email-delivery/

[#594]: http://www.redmine.org/issues/594
[#1018]: http://www.redmine.org/issues/1018
[#886]: http://www.redmine.org/issues/886
[#1406]: http://www.redmine.org/issues/1406
[#2628]: http://www.redmine.org/issues/2628
[#3597]: http://www.redmine.org/issues/3597
[#3920]: http://www.redmine.org/issues/3920
[#613]: http://www.redmine.org/issues/613
[#4409]: http://www.redmine.org/issues/4409
