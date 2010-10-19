---
created_at: 2009-11-16
layout: post
title: "Redmine 0.8.7 Released"
author: "Eric Davis"
published: true
categories:
- Home
- Community

---

Redmine [0.8.7][] was just released yesterday, November 15th.  This is a point release which fixes a **major** security vulnerability.  If you're running a public Redmine server, it's highly recommended that you upgrade as soon as possible.

### CSRF Security Vulnerability

The Redmine security team was contacted by p0deje about a potential [CSRF][] vulnerability with some example code to exploit it.  After reviewing it, we created a fix and rushed out [0.8.7][] to address the vulnerability.

### Hide the paragraph terminator on HTML exports

On the wiki pages there is a paragraph terminator (¶) after each heading to make it easy to link to a specific section of the page.  As of [r3026][], this will now be hidden on the HTML export of the page until the heading is hovered over. Issue [#4194][].

### Start date not included in the spent time report with SQLite

0.8.7 includes a fix for the Spent Time report with SQLite.  It appears that the starting date was using the time of "00:00:00" with the dates which caused SQLite to exclude today in the range.  This should be fixed in [r3009][], Issue [#3112][]

### Preformatted tags with `<pre` would be incorrectly formatted

You can now enter tags starting with `pre` into a `<pre>` block.  There was a bug where Redmine would think that the content should have another `<pre>` tag added instead of just rendering the tag as it was entered.  For example if you enter some xml inside a pre sections like:

    <pre>
      <xml>
        <prepared-statement>Some xml</prepared-statement>
      </xml>
    </pre>

Redmine was seeing the inner `pre` in `prepared-statement` and thought it was another preformatted block.  This is now fixed in [r3030][], Issue [#4125][]


### Password field on the login page was styled differently

On the login page for Redmine, the password field was styled differently on the alternative theme than any other text fields.  [r3032][] adds some styling rules so the fields will match.  Issue [#3845][].

To see more details about all of the changes in 0.8.7, check out the [Changelog](http://www.redmine.org/projects/redmine/changelog#0.8.7) posted to [Redmine.org][].

Eric Davis

[Redmine.org]: http://www.redmine.org
[0.8.7]: http://www.redmine.org/news/30
[#4194]: http://www.redmine.org/issues/4194
[#3112]: http://www.redmine.org/issues/3112
[#4125]: http://www.redmine.org/issues/4125
[#3845]: http://www.redmine.org/issues/3845
[CSRF]: http://en.wikipedia.org/wiki/Cross-site_request_forgery

[r3026]: http://www.redmine.org/projects/redmine/repository/revisions/3026
[r3009]: http://www.redmine.org/projects/redmine/repository/revisions/3009
[r3030]: http://www.redmine.org/projects/redmine/repository/revisions/3030
[r3032]: http://www.redmine.org/projects/redmine/repository/revisions/3032

