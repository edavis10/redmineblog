---
created_at: 2009-04-20
layout: post
title: "Setup Redmine to send email using GMail"
author: "edavis"
published: true
categories:
- Code
- Home

---

 
There's been quite a [discussion][thread] about setting up Redmine to use [GMail][gmail]'s SMTP server for sending emails.  I've seen this being a pain point for a lot of people so I've decided to write up a set of directions on how to get your Redmine setup to use GMail's SMTP.  I've tested this process with Redmine [0.8.3][download], [0.8-stable][], and [trunk][] (r2670) using my personal GMail account.

### 1. Install the action\_mailer\_optional\_tls plugin

The `action_mailer_optional_tls_plugin` adds a `TLS` option to Redmine's emailing library, ActionMailer.  TLS is a version of SSL which is required by GMail in order to send email.

To install this plugin, use the `script/plugin` command in your Redmine directory:

    ruby script/plugin install git://github.com/collectiveidea/action_mailer_optional_tls.git


### 2. Configure your email.yml

Redmine uses `email.yml` to store all the configuration for the email servers.  This is used instead of `config/environment.rb` to setup a connection to a SMTP server.  Each Redmine environment (development, test, production) can have it's own configuration section.  If you are configuring Redmine to be used on a production server, I'd recommend just configuring the production mode like below:

{% highlight yaml %}
# File: config/email.yml
production:
  delivery_method: :smtp
  smtp_settings:
    tls: true
    address: "smtp.gmail.com"
    port: '587'
    domain: "smtp.gmail.com"
    authentication: :plain
    user_name: "your_email@gmail.com"
    password: "your_password"

{% endhighlight %}

A complete file that uses GMail for development and production would look like:

{% highlight yaml %}
# File: config/email.yml
production:
  delivery_method: :smtp
  smtp_settings:
    tls: true
    address: "smtp.gmail.com"
    port: '587'
    domain: "smtp.gmail.com"
    authentication: :plain
    user_name: "your_email@gmail.com"
    password: "your_password"

development:
  delivery_method: :smtp
  smtp_settings:
    tls: true
    address: "smtp.gmail.com"
    port: '587'
    domain: "smtp.gmail.com"
    authentication: :plain
    user_name: "your_email@gmail.com"
    password: "your_password"

test:
  delivery_method: :test
{% endhighlight %}

**One important thing to watch, is that this file only uses spaces.**  If there are tabs anywhere it in, Redmine will not be able to read the file correctly and you will not be able to connect to GMail.

### 3. Start up Redmine and test your Email

Next it's time to start up Redmine and to send a test email.  Make sure that you start Redmine in the same mode as you configured above (e.g. production).  To send a test email:

1. Login as an administrator
2. Go to the Administration panel
3. Go into the Settings and select the "Email notifications" tab
4. In the bottom right, click the link to "Send a test email"

This should cause Redmine to send a email using GMail's SMTP.  Below you can see a log of the connection from my log/production.log:

<pre>
Processing SettingsController#index (for 127.0.0.1 at 2009-04-13 16:24:50) [GET]
  Parameters: {"action"=>"index", "controller"=>"settings"}
Rendering template within layouts/base
Rendering settings/edit
Completed in 1029ms (View: 840, DB: 9) | 200 OK [http://localhost/settings]
-> "220 mx.google.com ESMTP 28sm495064wfd.5\r\n"
<- "EHLO smtp.gmail.com\r\n"
-> "250-mx.google.com at your service, [0.0.0.0]\r\n"
-> "250-SIZE 35651584\r\n"
-> "250-8BITMIME\r\n"
-> "250-STARTTLS\r\n"
-> "250-ENHANCEDSTATUSCODES\r\n"
-> "250 PIPELINING\r\n"
<- "STARTTLS\r\n"
-> "220 2.0.0 Ready to start TLS\r\n"
<- "EHLO smtp.gmail.com\r\n"
-> "250-mx.google.com at your service, [0.0.0.0]\r\n"
-> "250-SIZE 35651584\r\n"
-> "250-8BITMIME\r\n"
-> "250-AUTH LOGIN PLAIN\r\n"
-> "250-ENHANCEDSTATUSCODES\r\n"
-> "250 PIPELINING\r\n"
<- "AUTH PLAIN ---------------\r\n"
-> "235 2.7.0 Accepted\r\n"
<- "MAIL FROM:<me@littlestreamsoftware.com>\r\n"
-> "250 2.1.0 OK 28sm495064wfd.5\r\n"
<- "RCPT TO:<me@littlestreamsoftware.com>\r\n"


Processing AdminController#test_email (for 127.0.0.1 at 2009-04-13 16:25:11) [GET]
  Parameters: {"action"=>"test_email", "controller"=>"admin"}
Sent mail to 
-> "250 2.1.5 OK 28sm495064wfd.5\r\n"
<- "DATA\r\n"
-> "354  Go ahead 28sm495064wfd.5\r\n"
writing message from String
wrote 2605 bytes
-> "250 2.0.0 OK 1239665113 28sm495064wfd.5\r\n"
<- "QUIT\r\n"
-> "221 2.0.0 closing connection 28sm495064wfd.5\r\n"
Redirected to controllersettingstabnotificationsactionedit
Completed in 2293ms (DB: 4) | 302 Found [http://localhost/admin/test_email]
</pre>

If you're curious about what the connection is saying, any `->` is GMail talking to Redmine and any `<-` is Redmine talking to Gmail.  The important thing to see is where GMail responds with a 250 status code near the end of the connection.  This means that the connection was successful and that the email will be delivered.  About a minute later, I saw the test email in my inbox from GMail.

### Conclusion

If you follow this set of directions, you can easily setup [GMail][gmail] with [Redmine][redmine].  If this was helpful, please let me know in the comments or [suggest a new article][feedback].


[thread]: http://www.redmine.org/boards/2/topics/3399
[feedback]: https://projects.littlestreamsoftware.com/projects/redmine-blog/issues
[redmine]: http://www.redmine.org
[gmail]: http://mail.google.com
[download]: http://www.redmine.org/wiki/redmine/Download
[trunk]: http://www.redmine.org/projects/redmine/repository/browse/trunk
[0.8-stable]: http://www.redmine.org/projects/redmine/repository/browse/branches/0.8-stable

