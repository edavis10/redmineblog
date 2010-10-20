---
created_at: 2010-01-21
kind: article
title: "Community Update #6"
author: "Eric Davis"
published: true
categories:
- Home
- Code
- Community
- Plugins
- Themes
---

There's been a lot of activity in the [Redmine](http://www.redmine.org) community over the past few months.  Here are some highlights from November 2009:

## Code changes

### Close versions

Versions can now be given a status which will close a version, preventing assigning new issues to it ([#1245][]).  This is great if you want to prevent adding additional features to a version, like during a release process.  The three version statuses are:

1. open: no restriction
2. locked: can not assign new issues to the version
3. closed: can not assign new issues and can not reopen assigned issues

[#1245]: http://www.redmine.org/issues/1245

### Url to fetch changesets for a repository

In [#2925][] a new action was added to allow fetching the changesets for a repository to be triggered by a url.  This means that when:

`http://your-redmine.com/sys/fetch_changesets` is called Redmine will fetch all of the changesets for all projects.

You can also specific only one project to fetch with `http://your-redmine.com/sys/fetch_changesets?id=my-project-id`.

[#2925]: http://www.redmine.org/issues/2925

### Update trackers from the issue form

Feature [#2405][] changed the issue form so the Tracker Type can be changed as part of an issue update.  This means that if a Feature was entered incorrectly as a Bug, it can be updated directly.  Doing this used to require Moving the issue first.

[#2405]: http://www.redmine.org/issues/2405

### Add or remove columns from the issue list

Feature [#4272][] adds a new set of options to the Issues list filters.  Now you can add, remove, and reorder columns on the fly.  I've found this useful for running reports on the issues like: "What are the target versions of issues that have an estimate, are due this week, and are assigned to someone?".

[#4272]: http://www.redmine.org/issues/4272

### Tree based menus

Redmine will now support Tree based menus.  This means any of the menus (the project menu, the top menu, the administration menu) can now have submenus and submenus.  The Redmine core isn't taking advantage of this change yet, but some plugins have created additional menus and I suspect this will be used more in the near future.

The [feature request](http://www.redmine.org/issues/4250) shows an example of how the menus are structured as well as how to use the new API.

### Allow custom fields for Versions

[#4219][] added support for defining custom fields on Versions.

[#4219]: http://www.redmine.org/issues/4219

### Copy and Move

A 'Copy' check box was added to the Issue Move form.  This will make it easy to copy multiple issues to another area of Redmine (e.g. different project, different Tracker).  Added for Feature [#1847](http://www.redmine.org/issues/1847).

### Managers able to create subprojects

[#2963][] fixed a bug so users with the "Add Project" permission can now create sub projects.  Before, they could only create top level projects.

[#2963]: http://www.redmine.org/issues/2963


### "View Issues" user permission

[#3187][] adds a new permission "View Issues".  This permission has always been "on" for users but now it is possible to turn it off if you don't want someone to see the issues list at all.

[#3187]: http://www.redmine.org/issues/3187

### Allow [#id] as subject to reply by email

When the Email Receiving option is Redmine is configured, sending an email with the subject line of:

> Subject: [#101]

would not find issue #101 correctly.  Bug [#3653](http://www.redmine.org/issues/3653) corrects this.

### child_pages wiki macro on with ?version in URL

[#4152][] added the ability to specify a specific page version when using the `child_pages` wiki macro.

[#4152]: http://www.redmine.org/issues/4152

## Community Events

### 6 new themes from Rajesh Krishnan

Rajesh Krishnan has released [6 new themes for Redmine][new-themes].  Each one has a different color scheme with some minor variations.  If you're looking for a new theme for your Redmine, check them out.

[new-themes]: http://www.redmine.org/boards/3/topics/9924

### Screenshot pasting plugin

Jean-Philippe Lang posted a [quick plugin][screenshot] for Redmine that shows how a screenshot can be pasted directly into the issue form using a Java applet.

[screenshot]: http://www.redmine.org/issues/3816#note-8

### Redmine Harvest plugin

Jim Mulholland created a [plugin to integrate Harvest](http://www.redmine.org/boards/3/topics/9702) time tracking into Redmine.  He includes a short screencast of how it works on his [blog post](http://squeejee.com/blog/apps/2009/11/18/integrate-harvest-time-into-redmine/).

### Scrum PM plugin

Marcin Jędras is working on a [Scrum plugin](http://www.redmine.org/boards/1/topics/9660) for Redmine.  It current supports some drag and drop planning but he's planning to add more features in the next releases.

### iRedmine - iPhone app

Thomas Stägemann has released an iPhone app for Redmine called [iRedmine](http://www.redmine.org/boards/2/topics/9460).  It's released under the GPL and the code is available on [Github](http://github.com/wwk/iRedmine).  I've tried it out and it's a great start.  There are still some bugs but I've already found it useful, especially while traveling.


