---
created_at: 2009-09-14
layout: post
title: "Redmine 0.8.5 Released"
author: "Eric Davis"
published: true
categories:
- Home
- Community

---

Redmine [0.8.5][] was released on September 13th, 2009.  This release is a point release which includes some security fixes found in Ruby on Rails 2.1.2 and some bug fixes in Redmine.  If you're running an older version of the Redmine 0.8.x series, it's recommended that you upgrade as soon as possible.  Once you've upgraded, you might notice that the version is still called [0.8.4][version.rb].  That's a mistake, we forgot to increment the version number when it was tagged.

### Security fixes

The Ruby on Rails core team announced two security vulnerabilities in Rails on September 3rd.  These were a [XSS](http://en.wikipedia.org/wiki/Cross-site_scripting) Vulnerability and a Timing Weakness when using the cookie session store.  Redmine 0.8.5 includes the patched versions of Rails in the official download.  If you are running the Subversion version, it's strongly recommended that you patch your Ruby on Rails installation.

* [XSS Vulnerability in Ruby on Rails](http://groups.google.com/group/rubyonrails-security/browse_frm/thread/48ab3f4a2c16190f)
* [Timing Weakness in ActiveSupport::MessageVerifier and the Cookie Store](http://groups.google.com/group/rubyonrails-security/browse_frm/thread/da57f883530352ee)


### Show plugins on script/about

`script/about` is used to print information about the current Redmine environment, such as the versions of Rails and the database.  0.8.5 has enhanced `script/about` to list the currently installed Redmine plugins and their versions.  This should make it easier to get help on specific plugin versions.

For example:
<pre>
About your application's environment
Ruby version              1.8.6 (i486-linux)
RubyGems version          1.3.1
Rails version             2.2.2
Active Record version     2.2.2
Action Pack version       2.2.2
Active Resource version   2.2.2
Action Mailer version     2.2.2
Active Support version    2.2.2
Application root          /home/edavis/dev/redmine/redmine-core
Environment               development
Database adapter          mysql
Database schema version   20090518163007

About your Redmine plugins
Redmine Hoptoad Server plugin          0.0.1
Redmine Exception Handler plugin       0.2.0
Little Stream Software Design plugin   0.1.0
Redmine Graphs plugin                  0.1.0
Redmine Schedules plugin               0.4.1
Redmine My Widgets plugin              0.1.0
Rate Plugin                            0.1.0
Download Counter                       0.1.0
</pre>

### Command line subversion tweaks

**Update: I forget to merge this feature into 0.8.5 so it's not part of this release.  It will be in 0.8.6.**

The Subversion adapter received a few tweaks in this release.  Now when Redmine is fetching data from the Subversion server, it will run non-interactively and will not cache authentication.  This will prevent problems where `svn` hangs while waiting for a response from the user.

### Links to closed issues are distinct from open issue

**Update: I forget to merge this feature into 0.8.5 so it's not part of this release.  It will be in 0.8.6.**

Now when a closed issue is linked to, Redmine will strike-through the text and also color it in a lighter gray.  This makes reading a long list of issues a lot easier.  See [issue #3495](http://www.redmine.org/issues/3495) for a before and after screenshot.

### Mail Handler tweak

When using an incoming mail handler with Redmine, keywords can now have a space before the colon.  Some mail clients will insert a space before the colon so Redmine wouldn't recognize the keyword.  If you'd had a problem with your email keywords not getting recognized, it should be fixed in 0.8.5.

### New plugin hooks

If you are a plugin developer, 0.8.5 includes a few new plugin hooks that can be used:

* `:controller_messages_new_after_save`
* `:controller_messages_reply_after_save`
* `:controller_timelog_edit_before_save`
* `:controller_wiki_edit_after_save`
* `:model_changeset_scan_commit_for_issue_ids_pre_issue_update`
* `:view_account_left_bottom`
* `:view_account_right_bottom`
* `:view_versions_show_contextual hook`

To see all of the changes in 0.8.5, check out the [Changelog](http://www.redmine.org/projects/redmine/changelog#0.8.5) posted to [Redmine.org][].


[Redmine.org]: http://www.redmine.org
[0.8.5]: http://www.redmine.org/news/27
[version.rb]: http://www.redmine.org/projects/redmine/repository/entry/tags/0.8.5/lib/redmine/version.rb
