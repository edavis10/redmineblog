---
created_at: 2009-04-29
kind: article
title: "Community Update #1"
author: "edavis"
published: true
categories:
- Code
- Community
- Home
- Plugins

---

 
This is the first installment of regular updates of what's happening the Redmine community.  I'm going to highlight the recent code changes and some important events by community members.  This installment covers from March 20th through March 28th.

## Code Changes

There was a lot of activity this past week with Jean-Philippe fixing a lot of bugs that have cropped up in trunk.

### Email notifications of status changes on issues used the old status in the subject

In [#3194][], Chaoqun Zou noticed that if an issue's status was changed, the email notifications would use the old Status name in their subject line.  This was fixed by a minor change to the emailing methods in [r2673][].

### Deleting a parent wiki page will prompt about removing child pages.

Before [r2676][], when a parent wiki page was removed all of the child pages would be deleted also.  This is could cause some data loss if the user isn't aware of it.  Now, when a parent page is deleted, the user will be prompted with a few options for what to do with the child pages:

* Move the child pages to the root of the wiki
* Move the child pages under a different parent page
* Delete the child pages.

Issue [#3202][] has some more details about this change.

### Missing attachment

Missing attachment files will now return a HTTP 404 not found instead of the 500 error.  I've seen this come up a couple of times.  [r2692][]

### Issue Grouping

<a href="http://redmineblog.com/assets/2009/4/29/issue_grouping.png" style="float:right">
  <img src="http://redmineblog.com/assets/2009/4/29/issue_grouping_thumb.png" alt="Issue Grouping" />
</a>

Jean-Philippe Lang committed a very nice feature to the Issues list in [r2696][], Issue grouping.  Now the Issue List can be grouped by a specific column.

## Community Events

### Schedules plugin release

Brad Beattie just [released][schedules_release] a new version of the Schedules plugins.  This version should be compatible with both Redmine 0.8.3 and trunk.  I've been using Schedules everyday since it was first released to help plan out my day.

### Local avatar plugin released

Andrew Chaika has been busy developing a few plugins for Redmine.  He has an [Local Avatars][local_avatars] plugin that will let administrators use local versions of user avatars instead of the Gravatar service.  Like he said, this would be useful for corporate emails that can't use Gravatar.

### Vote plugin released

Not to be content with only one release, Andrew Chaika also released the first version of the [Issue Vote][vote] plugin. This plugin will allow users to vote on issues.  This would be **extremely** useful for public or Open Source projects to discover user interest.  I'm going to be looking at adding it to [my Redmine][lss_redmine] soon.

### Rate and Budget plugins released

I've also released the first version of the [Redmine Rate][rate] plugin and an update to the [Budget plugin][budget].  I personally think they are great plugins, but I'm *little* biased.

### Synchronizing Two Git Repositories

Farzad FARID recently wrote up a great tutorial for [synchronizing two git repositories with Redmine][git_sync].  In his example, he configured his Redmine git repository to sync up with a GitHub one.

---

If you hear about something in the Redmine community that you think is useful, please [let me know][new post] about it and I'll try to spread the word.

Eric

[new post]: https://projects.littlestreamsoftware.com/projects/redmine-blog/issues/new
[r2673]: http://www.redmine.org/projects/1/repository/revisions/2673
[r2676]: http://www.redmine.org/projects/1/repository/revisions/2676
[r2692]: http://www.redmine.org/projects/1/repository/revisions/2692
[r2696]: http://www.redmine.org/projects/1/repository/revisions/2696
[#3202]: http://www.redmine.org/issues/3202
[#3194]: http://www.redmine.org/issues/3194
[schedules_release]: http://www.redmine.org/boards/3/topics/5660#message-5704
[local_avatars]: http://www.redmine.org/boards/3/topics/5365
[vote]: http://www.redmine.org/boards/3/topics/5506
[lss_redmine]: https://projects.littlestreamsoftware.com
[rate]: http://www.redmine.org/boards/3/topics/5635
[budget]: http://www.redmine.org/boards/3/topics/5670
[git_sync]: http://www.redmine.org/wiki/redmine/HowTo_keep_in_sync_your_git_repository_for_redmine

