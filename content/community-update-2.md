---
created_at: 2009-05-19
layout: post
title: "Community Update #2"
author: "edavis"
published: true
categories:
- Code
- Community
- Home
- Plugins

---

 
This is the second installment of what's happening the Redmine community.  This installment covers from March 28th through May 18th, which ended up being somewhere around 700 changes, messages, and updates.  I've tried to highlight some of the major code changes and events in the community.

## Code Changes

### Redmine 0.8.4 released

[Redmine 0.8.4][0.8.4] was released this past weekend.  It's a bug fix release with a security update may affect people running Phusion Passenger.  The list of bugs fixed in the release can be found on the [changelog][changelog].  Since this fixes a potential security issue (below), all users are recommend to upgrade or audit their Redmine install.

### Weak autologin token generation algorithm causes duplicate tokens

The random sequence generator used by the autologin token wasn't being checked if it was creating unique values.  This generator was replaced with the one from Ruby on Rails in `ActiveSupport::SecureRandom` and a database validation to improve security.  Alexander Pavlov included a [database query][#3351] to see if you have been affected by the bug.

### Add email notification on Wiki changes

Jean-Philippe Lang added an option to send email notification of wiki page creations and changes in [r2749][r2749].  It can be enabled in the Administration Panel under Email Notifications.  The email notifications look good and include a link to view the diff of the wiki page on Redmine.

### Create project for no administrator user

Jean-Philippe Lang changed how projects are created in Redmine so normal users can now be given permission to create projects.  This is controlled by the "Create Project" permission so each site can turn it on or off for specific users.  [#1007][#1007]

### Users can have multiple roles

Jean-Philippe Lang committed yet another great feature to Redmine in [Issue #706][#706].  Now a user will be able to have multiple Roles on a project, making it easier to control permissions and security.  I'm going to start using this feature by separating out some common Roles like "Bookkeeper" and "Reports".  Since this was a pretty major feature, there are going to be a few bugs to work out of the system as it's used.  I'd recommend trying it out in a development environment for now and waiting a week or so for any major issues to be resolved.

### script/about was failing on the production database

`script/about` is a Ruby script that will print out information about the current Redmine environment including library versions, database versions, and other debugging information.  It looks like there was an error on a Ruby on Rails update so the script would only load the development environment.  In [r2733][r2733] the missing library was added so `script/about` should work for production instances again.

## Community Events

### Redmine Blog Plugin

Andrew Chaika just released [Redmine Blog 0.0.3][blog_plugin].  This is a plugin that will give users the ability to write blog posts inside of Redmine.  I think this could be very interesting on larger projects where teams want to store knowledge about the project inside of Redmine itself.

### Redmine Code Review Plugin

Haru Iida released a [Code Review plugin][code_review] for Redmine.  This will let a user add a code review on a particular piece of code in the code repository.  I'm considering using this on my Open Source plugins so others can help to review and improve the code.

---

If you hear about something in the Redmine community that you think is useful, please [let me know][new post] about it and I'll try to spread the word.

Eric

[new post]: https://projects.littlestreamsoftware.com/projects/redmine-blog/issues/new
[blog_plugin]: http://www.redmine.org/boards/3/topics/5782
[code_review]: http://www.redmine.org/boards/3/topics/5878
[r2749]: http://www.redmine.org/projects/redmine/repository/revisions/2749
[r2733]: http://www.redmine.org/projects/redmine/repository/revisions/2733
[0.8.4]: http://www.redmine.org/news/26
[changelog]: http://www.redmine.org/wiki/redmine/Changelog#v084-2009-05-17
[#1007]: http://www.redmine.org/issues/1007
[#706]: http://www.redmine.org/issues/706
[#3351]: http://www.redmine.org/issues/3351#note-5

