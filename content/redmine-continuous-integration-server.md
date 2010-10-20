---
created_at: 2010-03-24
kind: article
title: "Redmine Continuous Integration Server"
author: "Eric Davis"
published: true
categories:
- Home
- Code
- Community
---

![Finnlabs CI Server](/assets/2010/3/finnlabs-ci.png)

The development group at [finnlabs][] have setup a [continuous integration server][] for Redmine at [ci.finn.de][].  It's currently testing the entire range of supported Ruby versions and databases with Redmine (and some versions that aren't fully supported yet):

* Redmine 0.9.x on MySQL with Ruby 1.8.7
* Redmine 0.9.x on Postgres with Ruby 1.8.7
* Redmine 0.9.x on Sqlite3 with Ruby 1.8.7
* Redmine trunk on MySQL with Ruby 1.8.7
* Redmine trunk on Postgres with Ruby 1.8.7
* Redmine trunk on Sqlite3 with Ruby 1.8.7
* Redmine 0.9.x on MySQL with Ruby 1.9.1
* Redmine 0.9.x on Postgres with Ruby 1.9.1
* Redmine 0.9.x on Sqlite3 with Ruby 1.9.1
* Redmine trunk on MySQL with Ruby 1.9.1
* Redmine trunk on Postgres with Ruby 1.9.1
* Redmine trunk on Sqlite3 with Ruby 1.9.1
* Redmine 0.9.x on MySQL with Ruby jruby
* Redmine 0.9.x on Postgres with Ruby jruby
* Redmine 0.9.x on Sqlite3 with Ruby jruby
* Redmine trunk on MySQL with Ruby jruby
* Redmine trunk on Postgres with Ruby jruby
* Redmine trunk on Sqlite3 with Ruby jruby


It's hooked up to the official Redmine repository so every code change will run the tests to make sure nothing was broken and report to the `#redmine` IRC channel.  This will really make it easy for the Redmine developers to make sure Redmine runs correctly on the broadest set of platforms it can.

Thanks [Holger Just][], [Gregor Schmidt][], [Konstantin Haase][], and the rest of the team at [finnlabs][] for managing this resource for the Redmine community.


[finnlabs]: http://finn.de
[continuous integration server]: http://en.wikipedia.org/wiki/Continuous_integration
[ci.finn.de]: http://ci.finn.de
[Holger Just]: http://twitter.com/meineerde
[Gregor Schmidt]: http://twitter.com/schmidtwisser
[Konstantin Haase]: http://twitter.com/konstantinhaase
