---
created_at: 2009-07-17
layout: post
title: "Community Update #3"
author: "edavis"
published: true
categories:
- Code
- Community
- Home
- Plugins
- Themes

---

 
It's time for another update on what's been happening in the Redmine community.  This installment covers from May 18th through July 12th.

## Code Changes

### Anonymous issue creation via email

Redmine's mail handler is a very powerful component, allowing users to send email to create new issues or update existing ones.  [r2789][] added some additional options, including the ability to accept email from unknown users and automatically create accounts for them.  This makes it easy to publish an email address for anyone to send new requests directly to Redmine.

### Enhancement to about script

The about script, commonly called `script/about`, is used to let someone know what version of Redmine and Ruby on Rails you are running.  [#3387][] enhanced the script to also include information about the installed Redmine plugins and their version.  I know this will help me support my plugins by understanding what versions people encounter bugs on.

### Administration panel breadcrumbs

A few sections of the Administration panel now has breadcrumb links to help navigate up a level.  Personally, I'd like to redo the entire navigation of the Administration panel, but that will have to wait. [r2810][] added breadcrumbs for:

* Custom Fields 
* Enumerations
* Issue statuses
* Roles
* Trackers
* Users

### Fix for Bazaar merge tags

When branches are merged in Bazaar, a merge commit is performed.  Redmine wasn't able to parse these merge commits which causing some commits to be missing from Redmine's database.  Scott Aubrey supplied a patch for parsing the merge commits correctly, which was committed in [r2780][].

### Enumerations storage change

[r2777][] included a major internal change to how Enumerations are stored.  Enumerations include time entry activities, document categories, and issue priorities.  To the user or administrator of Redmine, this change has no real impact.  But plugin developers can take advantage of this change by being able to define their own custom Enumerations.  If you are a plugin developer and need to store data that is similar to the existing Enumerations, I'd recommend you try to take advantage of this change.

### Plugin hooks

A few plugin hooks were added for plugin developers.

* `:view_versions_show_contextual` - [r2771][]
* `:view_account_left_bottom` - [r2772][]
* `:view_account_right_bottom` - [r2772][]
* `:model_changeset_scan_commit_for_issue_ids_pre_issue_update` - [r2773][]
* `:controller_messages_new_after_save` - [r2774][]
* `:controller_messages_reply_after_save` - [r2774][]
* `:controller_wiki_edit_after_save` - [r2774][]
* `:controller_timelog_edit_before_save` [r2775][]

### User Groups under development

I also noticed that Jean-Philippe Lang has started development on user groups in a separate `groups` branch.  User groups is one of the major features scheduled for 0.9 and I know several organizations that are looking forward to this feature, especially the time savings it'll have.  There's no time estimate when this will hit trunk but I suspect it will be over the next few weeks.

## Community Events

There was a huge number of plugins developed over the past months.  I'm so happy that the community is really innovating with plugins.

### Campfire notification plugin

Edouard Brière created a [Redmine plugin][campfire_plugin] that will send issue notifications to a [Campfire][] room.  This would be useful to get real time notification of Redmine updates into your company chatroom.  I wonder if someone will create one of these for IRC.

[campfire_plugin]: http://www.redmine.org/boards/3/topics/6215

### Code review plugin - 0.1.8.6

Haru Iida has released a new version of the [Code Review][code_review] plugin.  This is a minor release that includes some bug fixes from the last release.

[code_review]: http://www.redmine.org/boards/3/topics/5878

### Developer Rates plugin

Shaun Gilroy has released a plugin called [Developer Rates][dev_rates].  From what I've heard, this plugin will let you attach an hourly rate to each time entry in Redmine.  It's worth a look if you want to track any hourly costs in Redmine.

[dev_rates]: http://www.redmine.org/boards/3/topics/6449

### HoptoadServer plugin

Jan Schulz-Hofen has released the [HoptoadServer][hoptoad_server] plugin.  [Hoptoad][] is a service that will collect and manage errors from a Ruby on Rails application.  The service provides a free plugin that you use to report to the Hoptoad servers.  The HoptoadServer plugin allows Redmine to act as a Hoptoad server, replacing the need for the [Hoptoad][] service.  I'm already using this plugin with a few applications I'm hosting and I've been very happy getting all the errors sent directly to Redmine.

[hoptoad_server]: http://www.redmine.org/boards/3/topics/7231
[hoptoad]: http://hoptoadapp.com/welcome

### Hudson plugin

Toshiyuki Ando has released a plugin to integrate the [Hudson continuous integration system][hudson] into Redmine.  The [Hudson plugin][hudson_plugin] has been under active development, with several releases in the past month.  I don't run Hudson, but the integration this plugin provides is making me consider a switch to Hudson.

[hudson_plugin]: http://www.redmine.org/boards/3/topics/6650
[hudson]: http://wiki.hudson-ci.org/display/HUDSON/Meet+Hudson

### Issue import script

Joe Chin Hi Rene posted an example script that can be used to [import issues][issue_import] from a CSV file into Redmine.  If you're looking for a quick way to get a bunch of issues created, this script might be a good starting point.

[issue_import]: http://www.redmine.org/boards/2/topics/7073

### Laconi.ca plugin

Ciaran Jessup has released a [Laconi.ca plugin][] for Redmine that will integrate Redmine notifications into Laconi.ca, Twitter, or Identi.ca.  Once configured, this plugin will send notifications to the service making it easier to other people to follow what's happening in Redmine.  This continues the recent trend of having Redmine send it's notifications out to external services.

[Laconi.ca plugin]: http://www.redmine.org/boards/3/topics/7117

### Squeejee theme - 0.2.0

Mischa The Evil has uploaded a new version of the [Squeejee theme][squeejee] for Redmine.  This is a darker theme than the default Redmine theme and includes a wide variety of graphics.  Mischa has done a terrific job of documenting which versions of Redmine, browsers, and plugins are compatible with it.  If you're looking for a high quality theme with great support, I'd recommend trying anything Mischa packages.

[squeejee]: http://www.redmine.org/boards/3/topics/6343

### Redmine Collapse plugin - 0.2.2

Mischa The Evil also released a few updates to his [Redmine Collapse][collapse] plugin.  This plugin modifies the default layout of Redmine so the entire sidebar can be hidden away from view.  This is useful if you work with a lot of data or need more monitor space.  Once again, Mischa has some great documentation on it's compatibility on the [plugin page](http://www.redmine.org/wiki/redmine/PluginCollapse).

[collapse]: http://www.redmine.org/boards/3/topics/6737

### Watersky theme

Konstantin Zaitsev has posted a new theme for Redmine, titled [watersky][].  This is a nice blue theme for Redmine, using images instead of text links on the menus.

[watersky]: http://www.redmine.org/boards/1/topics/6716

### Wiki Extensions plugin

Haru Iida released another plugin which adds a few new wiki macros to Redmine, titled [Wiki Extensions][wiki_extensions].  If you're using the wiki in Redmine a lot, you will want to take a look at the demo page he put up to see if there's anything you could use.

[wiki_extensions]: http://www.redmine.org/boards/3/topics/7130

---

If you hear about something in the Redmine community that you think is useful, please [let me know][new post] about it and I'll try to spread the word.

Eric

[new post]: https://projects.littlestreamsoftware.com/projects/redmine-blog/issues/new

[r2789]: http://www.redmine.org/projects/redmine/repository/revisions/2789
[r2810]: http://www.redmine.org/projects/redmine/repository/revisions/2810
[r2780]: http://www.redmine.org/projects/redmine/repository/revisions/2780
[r2771]: http://www.redmine.org/projects/redmine/repository/revisions/2771
[r2772]: http://www.redmine.org/projects/redmine/repository/revisions/2772
[r2773]: http://www.redmine.org/projects/redmine/repository/revisions/2773
[r2774]: http://www.redmine.org/projects/redmine/repository/revisions/2774
[r2775]: http://www.redmine.org/projects/redmine/repository/revisions/2775
[r2777]: http://www.redmine.org/projects/redmine/repository/revisions/2777

[#3387]: http://www.redmine.org/issues/3387

[Campfire]: http://campfirenow.com/
[Hoptoad]: http://hoptoadapp.com/

