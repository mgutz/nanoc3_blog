---
title: Getting Started With nanoc3_blog 
kind: article
tags: [haml, nanoc3, sass]
created_at: 2010/01/15
excerpt: Get started with nanoc3_blog
keywords: nanoc blog example, nanoc3 blog example
_:
---

## Prerequisites

Know how to use `terminal, Ruby, HAML, SASS` and `Markdown`.

## Installation

From the command line

    % gem install bundler
    % git clone git://github.com/mgutz/nanoc3_blog.git your_blog
    % cd your_blog
    % bundle install

## Previewing the Site

Compile the site

    # cleans output/ directory. `rm -rf output` works just as well
    % rake clean 

    # compiles content/* and copies static/* to output/
    % nanoc compile

    # runs preview server and autocompile on page refresh
    % nanoc aco

Preview the site on `http://localhost:3000`


## Customizing Existing Content

Edit these two files:

    content/about.md
    content/sticky.md # box content on front page

Delete articles to remove them from site. Then, recompile and restart server.

To change the front page: `content/index.haml`

To change the site layout: `layouts/default.haml`

To style the site: `content/assets/style.sass`


## Adding Content

Edit the Markdown file created by running this command:

    # filename is written to console
    % rake create:article title='Hello world'

After compiling or refresh in preview mode, view your page from the front page, archives link and tags link 
if you entered tags.


## Configuration

Edit the configuration files:

    config.yaml
    content/atom.xml.erb

## Deployment

Transfer `output/*` to your hosted web server. If use rsync, then
edit the settings in `config.yaml` and execute

    % rake deploy:rsync
