---
created_at: 2009-10-09
kind: article
title: "Asynchronous Email Delivery"
author: "Eric Davis"
published: true
categories:
- Home
- Code
---

I wanted to share a simple performance tweak for Redmine's email notifications that you might not know about

### Overview

Redmine sends email notifications when an event happens, like an issue update.  This happens entirely within the [HTTP request/response cycle](http://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol); so if your email server is slow, Redmine will also be slow because it's waiting on the server to respond.  The basic steps Redmine takes during an issue update is:

1. User updates issue #100 with a new comment
2. Redmine saves the comment to the database
3. Redmine connects to the email server to deliver the email notifications
4. The email server receives the connection and sends the email
5. Redmine redirects the User to the updated issue #100

So if the emailing steps (#3 and #4) take a long time, the user would have to wait for the email server to send the email before the user saw the new page.  If we can bypass the email steps, the user would be able to do keep working while the email is processed.

The standard Rails way for bypassing the email server is to use a [message queue][] and run a background process to send emails.  There is a specialized Rails plugin that can do this for email, called [ar_mailer][].  But Redmine comes with another option that is trivial to setup and gives good enough performance.  This option is the `:async_smtp` and `:async_sendmail` delivery_methods, added in issue [#613](http://www.redmine.org/issues/613).  To configure them, all you have to do is to change one option in your `config/email.yml` and restart Redmine.

### SMTP configuration example

{% highlight yaml %}
production:
  # Was  "delivery_method: :smtp"
  delivery_method: :async_smtp
  smtp_settings:
    tls: true
    address: "secure.emailsrvr.com"
    port: 587
    domain: "littlestreamsoftware.com"
    authentication: :plain
    user_name: 'projects@littlestreamsoftware.com'
    password: 'plugins'
{% endhighlight %}

### Sendmail configuration example

{% highlight yaml %}
production:
  # Was  "delivery_method: :sendmail"
  delivery_method: :async_sendmail
{% endhighlight %}

### How it works

The code for this is so trivial, I'm going to include it entirely in this post:

{% highlight ruby %}
### From config/initializers/10-patches.rb

# Adds :async_smtp and :async_sendmail delivery methods
# to perform email deliveries asynchronously
module AsynchronousMailer
  %w(smtp sendmail).each do |type|
    define_method("perform_delivery_async_#{type}") do |mail|
      Thread.start do
        send "perform_delivery_#{type}", mail
      end      
    end
  end
end

ActionMailer::Base.send :include, AsynchronousMailer
{% endhighlight %}

The guts of this code is in the `Thread.start` method call.  That will start a new Ruby thread to connect to the email server and perform the actual email delivery.  The original thread can continue on it's merry way and return the HTML response back to the user.  So the flow above would let steps 3 and 4 happen in parallel to step 5.  This might not be a large performance improvement, due to how Ruby threads work, but it's an easy thing to setup and could shave seconds off of your response time.

If your looking for an easy performance tweak, or you've noticed that your email server is responding slowly this would be worth the 10 minutes to test out.

*Technical note: This is a grossly simplified version of Ruby thread performance.  There are a lot of factors that will determine how much faster (if at all) this will make Redmine, including if either thread becomes blocked while waiting on IO (e.g. network IO to the web server, network IO to the email server).  At the very worst case, the performance will be almost as good as sending mail synchronously.*

[ar_mailer]: http://seattlerb.rubyforge.org/ar_mailer/
[message queue]: http://nubyonrails.com/articles/about-this-blog-beanstalk-messaging-queue
