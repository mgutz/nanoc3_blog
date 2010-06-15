---
title: About nanoc3_blog
---

# About This Site

nanoc3\_blog is a [nanoc3](http://nanoc.stoneship.org) blog starter kit for Ruby hackers.
The blog compiles into pure HTML. No javascript (keeping it simple). Ultra-fast and light. No database. No headaches. Host anywhere.

Source is available from my [nanoc3_blog](http://github.com/mgutz/nanoc3_blog) github repository.
Source is provided under the [FreeBSD License](/license.html).

Features: 

- Minimalist CSS site
- Uses file extension to determine filter:
  `{'.erb' => :erb, '.md' => :rdiscount, '.markdown' => :rdiscount,'.haml' => :haml, '.sass' => :sass}`
- Configurable 0..n full articles on the front page
- Configurable 0..n excerpted links on the front page
- Tagging / generation of tag pages
- Generates tags list
- Generates archives list
- Generates navigation links to articles by date
- [DISQUS](http://www.disqus.com) commenting integration (optional)
- RSS/atom feed
- Generates sitemap.xml for SEO

Interested? See [Getting Started With nanoc3_blog](/2010/01/15/getting_started_with_nanoc3_blog.html).

## About The Author

My name is Mario Gutierrez aka `mgutz`. I like minimal-styled blogs.

Visit [my blog](http://mgutz.com)

## Thanks

Thanks to everyone in the 
[nanoc group](http://groups.google.com/group/nanoc)
for sample code.

Thanks to [Denis Defreyne](http://stoneship.org/about/), author of nanoc.

I tried [other compilers](http://www.ruby-toolbox.com/categories/static_website_generation.html)
and chose nanoc3 for its architecture.
