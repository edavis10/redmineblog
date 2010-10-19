---
created_at: 2009-11-30
layout: post
title: "Community Update #4"
author: "Eric Davis"
published: true
categories:
- Home
- Code
- Community
- Plugins
---

I have a lot of updates from [Redmine][] for the Community Updates so I'm going to split them into a few posts.  This update will cover events from July 13th through September 1st.

## Code changes

### Git Branch support

Adam Soltys created a patch to add branch support for the git SCM repository.  This patch will let you browse through all of the branches in a git repository including the revisions and diffs.  It's gone through a few bug fixes but I've had some great experience using it in production on [my Redmine](https://projects.littlestreamsoftware.com) so far.  This was committed in [r2840][] for Issue [#1406][].

If you would to try this out, my [Stuff To Do project](https://projects.littlestreamsoftware.com/projects/redmine-stuff-to-do/repository) is public.

### Exporting a custom issue query to PDF will use the custom columns

In [r2841][] Jean-Philippe Lang fixed a bug that prevented custom columns from working with the issue list PDF export.

### Journal entry in Issue not displaying correctly

I added a small tweak to the Journal entries (Issue notes) so any lists are aligned properly when Gravatars are enabled or disabled.  Committed in [r2848][] for Issue [#3771][].

## Community Events

### Wiki Extensions plugin

Haru Iida has made several updates to his Wiki Extensions plugin.  It's under rapid development so if you're interested in it I'd recommend watching the [forum thread](http://www.redmine.org/boards/3/topics/7130) about it.


### Code Review plugin

Haru Iida also released a few new versions of the Code Review Plugin with a bunch of bug fixes and compatibility updates.  You can find the release notes in these forum topics: [Code Review Plugin 0.2.0 Released.][1] and [Code Review Plugin 0.2.7 Released.][2].


### NewIssueAlerts plugin

chantra created a new plugin called NewIssueAlerts.  When it's installed, it will let you setup a Redmine project to add an email address into the new issue email notification.  This would be useful to notify specific people whenever an issue is created.  You can read about the plugin on the [forum thread](http://www.redmine.org/boards/3/topics/7716) and download the plugin from [Github](http://github.com/chantra/redmine_newissuealerts)


### Global Filter Plugin

Kumudha Rangachari posted the Global Filter plugin which will display a list of your global filters on the Redmine homepage.  This would be very useful if you use saved Queries a lot and need to navigate to them quickly.  The [wiki page](http://www.redmine.org/wiki/redmine/PluginGlobalFilter) has some documentation as well as the Readme file on the [Github project](http://github.com/kumudhachari/global_filter_redmine_plugin).

It also includes a related change which I think is interesting.  On the issue list there will be a new set of filters which can be used to further the issue list to show only specific projects.  This is visible on the [wiki page](http://www.redmine.org/wiki/redmine/PluginGlobalFilter) in the screenshot at the very bottom.  Personally, I think this feature would be good to be included in the Redmine core.

### Default Assigned User

Robert Chady created a plugin that adds the ability to automatically assign an issue to a default user when it's created.  I'm thinking of using this on my smaller projects, where one person is responsible for the majority of the work.  You can get the plugin from [Github](http://github.com/rchady/redmine_default_assign) and read about it in [Issue #482][#482].


---

I'm thinking about writing these posts at the end of every month.  Let me know if you like that idea in the comments below.

[1]: http://www.redmine.org/boards/3/topics/7646
[2]: http://www.redmine.org/boards/3/topics/9627
[Redmine]: http://www.redmine.org

[#1406]: http://www.redmine.org/issues/1406
[#3771]: http://www.redmine.org/issues/3771
[#482]: http://www.redmine.org/issues/482

[r2840]: http://www.redmine.org/projects/redmine/repository/revisions/2840
[r2841]: http://www.redmine.org/projects/redmine/repository/revisions/2841
[r2848]: http://www.redmine.org/projects/redmine/repository/revisions/2848
