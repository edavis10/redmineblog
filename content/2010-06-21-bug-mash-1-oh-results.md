---
created_at: 2010-06-21
layout: post
title: "BugMash 1.0 Results"
author: "Eric Davis"
published: true
categories:
- Home
- Community
- Code
---

This weekend we held the first ever Redmine [BugMash][].  21 bugs were fixed, including everything needed for the upcoming [0.9.5][] release.

1. [pre can't be inside p](http://www.redmine.org/issues/5544)
1. [projects.atom with required authentication](http://www.redmine.org/issues/5317)
1. [Week number calculation in date picker is wrong if a week starts with Sunday](http://www.redmine.org/issues/4857)
1. [mail handler fails when the from address is empty](http://www.redmine.org/issues/5604)
1. [Member role forms  in project settings are not hidden after member added](http://www.redmine.org/issues/5452)
1. [session cookie path does not respect RAILS_RELATIVE_URL_ROOT](http://www.redmine.org/issues/3968)
1. [External links not correctly displayed in Wiki TOC](http://www.redmine.org/issues/5445)
1. ["fiters" and "options" should be hidden in print view via css](http://www.redmine.org/issues/5508)
1. [Ellipses at the end of snippets shouldn't be textilized ](http://www.redmine.org/issues/5533)
1. [NoMethodError (undefined method `[]' for nil:NilClass)](http://www.redmine.org/issues/5123)
1. [Add a hook to the issue report (Summary) view](http://www.redmine.org/issues/5233)
1. [Ruby 1.9 - wrong number of arguments (1 for 0) on rake db:migrate](http://www.redmine.org/issues/2990)
1. [Ruby 1.9 - when attempting to change password error raised IOError in MyController#password ](http://www.redmine.org/issues/4092)
1. [SVN Repository: Can not list content of a folder which includes square brackets.](http://www.redmine.org/issues/5548)
1. [Navigation to the Master Timesheet page (time_entries)](http://www.redmine.org/issues/4935)
1. [redmine:email:receive_imap fails silently for mails with subject longer than 255 characters](http://www.redmine.org/issues/5698)
1. [Fewer SQL statements generated for watcher_recipients](http://www.redmine.org/issues/5415)
1. [Exclude "fields_for" from overridden methods in TabularFormBuilder](http://www.redmine.org/issues/5416)
1. [TimelogController#destroy assumes success](http://www.redmine.org/issues/5700)
1. [Search for Numeric Value](http://www.redmine.org/issues/5676)
1. [Login and mail should not be case sensitive](http://www.redmine.org/issues/2473)

I also wanted to especially thank the participants who where able to get a patch contributed:

* Andrew Fenn
* Greg Mefford
* Gregor Schmidt
* Holger Just
* Jan
* Jean-Baptiste Barth
* Jérémy Lal
* Yuki Kita
* and many others who helped out on IRC this weekend.

Because of the success of this BugMash, we are considering having another one.  So if you weren't able to participate this time, there will be another one soon.  If you're interested in helping out, as a participant or an organizer, leave a comment below.

[irc]: irc://irc.freenode.net#redmine-dev
[bugmash]: http://www.redmine.org/wiki/redmine/BugMash-10
[rb]: http://wiki.railsbridge.org/projects/railsbridge/wiki/BugMash

[0.9.5]: http://www.redmine.org/versions/show/19
