---
created_at: 2009-05-06
layout: post
title: "Schedules plugin v 0.4.0 review"
author: "edavis"
published: true
categories:
- Home
- Plugins

---

 
Recently there was a new release of the [Redmine Schedules][plugin_page] plugin by Brad Beattie of [Gossamer Threads Inc.](http://www.gossamer-threads.com).  Since I've been using the first version of it for a few months now, I wanted to do a review of it so others can find out a bit more about it.

## What does it do?

The Schedules plugin is a plugin that lets users mange their daily schedules and plan when they will be working on specific projects.  It works across projects and have a variety of reporting methods.

## Who is it for?

It's for people who want to schedule themselves to work on a project for a period of time.  The majority of the reports are useful for managers to see how their staff is doing and to see if any scheduling adjustments need to happen.  I use it to plan out when I am going to work on a specific project and to see my work availability.

## Setup

### Install

The plugin follows the standard install process for Redmine plugins:

1. Download from the [released files][files] or [GitHub][github]
2. Extract the files to `vendor/plugins/redmine_schedules`
3. Run rake db:migrate_plugins 
4. Restart Ruby server

### Configuration

Schedules adds some new permissions to Redmine, so these will need to be configured in the Roles and Permissions administration panel.

* View Schedules - is a Role is allowed to see schedules at all?
* Edit Own Schedule - is a Role is allowed to edit their own schedule?
* Edit All Schedules - is a Role is allowed to edit other user schedules?

The final configuration the plugin needs is to enable the Schedule module for each project it's to be used on.  This can be do in the **Project Settings > Modules** area.

## Features

Schedules is a mature plugin with a lot of features.  I'm going to briefly go through some of the major features and one feature I think a lot of people might miss.

### User schedules

<a href="http://redmineblog.com/assets/2009/5/6/user_schedule.png"><img src="http://redmineblog.com/assets/2009/5/6/user_schedule_mid.png" /></a>

Each user with the View Schedules permission will get a personal schedule.  It can be accessed by the "My schedule" link on the top left menu.  The plugin will load the schedule for the current week showing blocks of time for each project the user is scheduled for.

In this example, you can see that the user is scheduled for 2 hours on the "Digitized system-worthy system" project and 6 hours for "Right-sized directional policy" for Monday the 4th.  The plugin allows lets a user change the week that is displayed and also page through the next and previous weeks.

### User Availability

In addition, each user is able to setup the amount of time they have available per day.  This can be used by the user to show that they work Monday through Friday for 7 hours and 8 hours on Tuesday.  In the image above, on May 5th there is a light gray block for the an extra hour the user available because their availability is 8 hours for Tuesdays.  I use this to see if I have any open availability each day, perfect for those emergency bug fixes.

### All user schedules

<a href="http://redmineblog.com/assets/2009/5/6/all_user_schedules.png"><img src="http://redmineblog.com/assets/2009/5/6/all_user_schedules_mid.png" /></a>

Once multiple users have entered a schedule, a summary view of all the user's schedules can be found at the "All schedule" link on the sidebar.  This report is useful to get an overview of who is working on what project for the week and to plan out any new work.

In the above image, it looks like Desiree Renner has some availability for Monday, Tuesdays, and Friday.  If I was her manager I might want to give her some more work on those days or reschedule some work from Wednesday and Thursday to balance it out.
 
### Project schedules

<a href="http://redmineblog.com/assets/2009/5/6/project_schedule.png"><img src="http://redmineblog.com/assets/2009/5/6/project_schedule_mid.png" /></a>

A Project's schedule can be reached by clicking any of the links to the Project on the user schedules or by the Schedule tab that is added to the Project.  This schedule looks the same as the user schedules but it collects the times all users are scheduled per day.  This report is great for seeing when people are going to be working on a project and if there is a enough staff assigned each week.

### Schedule Report

<a href="http://redmineblog.com/assets/2009/5/6/schedule_report.png"><img src="http://redmineblog.com/assets/2009/5/6/schedule_report_mid.png" /></a>

The Schedule report, linked from the sidebar, is a more detailed view of how people are scheduled.  Similar to Redmine's own Time Log report, this lets you select a date range and run queries on the data.  In heavier staffed projects, this report would be useful to get a long term view on scheduling.

### Issue estimated due date

<a href="http://redmineblog.com/assets/2009/5/6/estimate.png"><img src="http://redmineblog.com/assets/2009/5/6/estimate_mid.png" /></a>

Here's a nice feature that I think a few people have a hard time finding.  The purpose of this feature is to edit multiple issues to change their due dates to be the soonest they can be based on who the issue is assigned to and that person's schedule.  In order for this to work, some data needs to be setup first:

1. A Version needs to be created
2. Issues need to be assigned to a user
3. Issues need to have an Estimated time entered
4. Issues need to be assigned to the version

Once this is done, the Versions page will have an "Estimate" link in the top right menu.  Clicking this will run the calculations and will provide the estimated due dates for all the issues.  This would be a great way to see if a user is overloaded with work and will delay a project.

## Summary

Overall, I'm very impressed with the work Brad Beattie has done on this plugin.  I've noticed a few bugs in the few months I've used it and they are usually fixed in the next version.  I'm hosting the project on [my Redmine][lss] right now and your thoughts and ideas are welcome.

Eric


[lss]: https://projects.littlestreamsoftware.com/projects/redmine-schedules/issues
[plugin_page]: http://www.redmine.org/wiki/redmine/PluginSchedules
[github]: http://github.com/bradbeattie/redmine-schedules-plugin/tree/master
[files]: https://projects.littlestreamsoftware.com/projects/redmine-schedules/files

