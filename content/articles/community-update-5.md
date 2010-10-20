---
created_at: 2009-12-07
kind: article
title: "Community Update #5"
author: "Eric Davis"
published: true
categories:
- Home
- Community
- Code
- Plugins
---

There's been a bunch of activity in the [Redmine][] community lately.  This post will highlight some of the major changes from September and October.

## Code changes

### Groups

Jean-Philippe Lang added group support to the Redmine trunk.  This makes it easy to assign a set of people to each project.  Each group can be given an existing Role in Redmine so you can control their permissions using the existing settings.  Added in [r2869][] for Issue [#1018][].

### Attachments are added to an issue even during a failed save

A bug was fixed when a user would:

1. Try to post an update to an issue with a file attachment.
2. The update failed because someone else updated the issue first.
3. Attachments would still be added to the issue, without a journal entry.

[r2875][] changed this so the attachments would be deleted if the update failed (step #3).  I don't agree with the behavior, I'd rather have Redmine store the attachments and then try to reattach them after the user resubmits.  Added for Issue [#3846][].

### Include spent time in the Activity

When time is logged to a project, it can now be included as part of the Activity stream.  This also works on the cross-project Activity stream (e.g. http://example.com/activity).  Added in [r2877][] for Issue [#3809][].

### Customize the Issue filters on custom queries

Issue [#2883][] added the ability to edit the filters on a custom query.  So if you use custom queries for reporting, you can now add or remove filters to modify the data that's displayed without having to edit the custom query itself.

### Remove Watchers

Jean-Philippe Lang added the ability to remove issue watchers in [r2977][].  I've been missing this feature for some time, since I use watchers to make sure specific people are notified of changes to issues.

### Hide user profiles if they have no visible activity

User profiles (at /account/show/user-id) are now hidden unless the user has any public activity.  This will be useful to hide user accounts who should not be listed in the public.  Added in [r2986][] for Issue [#3720][].

## Community Events

### Backlogs plugin

Mark Maglana released the [Backlogs plugin][1], a plugin that will help a team visualize the work in progress and work remaining.  The [announcement][1] contains a url to a demonstration of the plugin.

### Workload plugin

Christopher Mann created a [Workload plugin][2] for Redmine.  It looks interesting and might compliment the [Schedules][] plugin.  The plugin can be downloaded from the [forum thread][2] or from [Github](http://github.com/chris2fr/redmine_workload/tree/master).

### Amazon S3 storage plugin

Christopher Dell has created a [plugin](http://www.redmine.org/boards/3/topics/8497) that will let Redmine save file uploads to Amazon's [S3 service][s3].  I'm extremely interested in this, since S3 storage is very cheap and makes hosting Redmine in the cloud a lot easier.  I'm planning on trying out the plugin and posting a review of it here.

### Bugzilla migration script

Ralph Juhnke has posted a new [migration script](http://www.redmine.org/issues/989#note-2) to convert a Bugzilla install to Redmine.  His script has been posted to [Github](http://github.com/ralli/bz2redmine) and should work with both Redmine 0.8.x and trunk.

### Redmine Repository Controls plugin

Brian created the [Redmine Repository Controls][4] plugin.  This plugin allows more fine grained repository access control and permissions, based on Subversion's SVNAuthz file.  It currently only supports Subversion but he's left the ability to support any SCM that uses WebDav.  More information can be found on it's [Google Code][3] page.

### Redmine Risk plugins

Daniel Neis Araujo and Nicolas Bertet both created two different risk management plugins for Redmine.  The plugins are both trying to make it easy for Redmine users to define and evaluate the different risks that are involved in a project.  As I haven't looked at either one yet, if you are using one please let me know what you think in the comments.


[1]: http://www.redmine.org/boards/3/topics/8339
[2]: http://www.redmine.org/boards/3/topics/8540
[3]: http://code.google.com/p/redminerepositorycontrol/
[4]: http://www.redmine.org/boards/3/topics/8952

[Redmine]: http://www.redmine.org
[s3]: http://aws.amazon.com/s3/

[#1018]: http://www.redmine.org/issues/1018
[#3846]: http://www.redmine.org/issues/3846
[#3809]: http://www.redmine.org/issues/3809
[#2883]: http://www.redmine.org/issues/2883
[#3720]: http://www.redmine.org/issues/3720

[r2869]: http://www.redmine.org/projects/redmine/repository/revisions/2869
[r2875]: http://www.redmine.org/projects/redmine/repository/revisions/2875
[r2877]: http://www.redmine.org/projects/redmine/repository/revisions/2877
[r2977]: http://www.redmine.org/projects/redmine/repository/revisions/2777
[r2986]: http://www.redmine.org/projects/redmine/repository/revisions/2986

[Schedules]: http://redmineblog.com/articles/schedules-plugin-v-0-4-0-review
