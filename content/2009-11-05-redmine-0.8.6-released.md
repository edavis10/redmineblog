---
created_at: 2009-11-05
layout: post
title: "Redmine 0.8.6 Released"
author: "Eric Davis"
published: true
categories:
- Home
- Community

---

Redmine [0.8.6][] was just released yesterday, November 4th.  This is another point release which fixes a few bugs and potential vulnerabilities.  If you're running an older version of Redmine, it's recommended that you upgrade as soon as possible.

### Command line subversion tweaks

*I previously reported this fixed in [0.8.5][] but it wasn't included in that release.*

The Subversion adapter received a few tweaks in this release.  Now when Redmine is fetching data from the Subversion server, it will run non-interactively and will not cache authentication.  This will prevent problems where `svn` hangs while waiting for a response from the user. Issue [#3424][].

### Links to closed issues are distinct from open issue

*I previously reported this fixed in [0.8.5][] but it wasn't included in that release.*

Now when a closed issue is linked to, Redmine will strike-through the text and also color it in a lighter gray.  This makes reading a long list of issues a lot easier.  Issue [#3495][].

### Hide user pages without activity

Each user has their own page at /account/show that will list their name, avatar, and any activity they've done in Redmine.  With this release, only users who have any activity will be displayed.  Issue [#3720][].

### Allow images on headers

With this version, a wiki formatted header can have an image embedded in like `h2. !/attachments/download/2690!`. Issue [#4112][].

### Editing an issue reply would escape special characters

If you edited a note on an issue, Redmine would convert special characters like `<` or `>` into the escaped versions.  This would cause the note to lose any special formatting when it's saved, because it was double escaped.  This should now be fixed. Issue [#3996][].

### Error when displaying a repository when a changeset has no comments

It's considered bad form to commit code without a comment but some system allow it.  If one of these commits was displayed by Redmine, it would throw an error page up. Issue [#4126][].

### Errors when a custom value was set to nil

This fixed an error on the project and users pages when a custom field had a nil (null) value. Issue [#3705][].

### New plugin hooks

0.8.6 also includes some more plugin hooks for developers:

* `:controller_issues_edit_after_save`
* `:controller_issues_new_after_save`

To see more details about all of the changes in 0.8.6, check out the [Changelog](http://www.redmine.org/projects/redmine/changelog#0.8.6) posted to [Redmine.org][].


[Redmine.org]: http://www.redmine.org
[0.8.6]: http://www.redmine.org/news/29
[0.8.5]: /articles/redmine-0.8.5-released
[#3424]: http://www.redmine.org/issues/3424
[#3495]: http://www.redmine.org/issues/3495
[#3720]: http://www.redmine.org/issues/3720
[#4112]: http://www.redmine.org/issues/4112
[#3996]: http://www.redmine.org/issues/3996
[#4126]: http://www.redmine.org/issues/4126
[#3705]: http://www.redmine.org/issues/3705


