---
title: Getting Started With nanoc3_blog 
kind: article
tags: [haml, kramdown, nanoc3, sass]
created_at: 2010/01/15
excerpt: How to create a blog using nanoc3_blog starter kit
---

## Prerequisites

Know how to use command-line shell, `Ruby, HAML, SASS and Markdown`.

## Installation

From the command line

    % gem install rack rake mime-types nanoc3 haml kramdown
    % git clone git://github.com/mgutz/nanoc3_blog.git your_blog

## Configuration

Edit the configuration files:

    config.yaml
    content/atom.xml.erb

## Previewing the Site

Compile the site

    # cleans output/ directory. `rm -rf output` works just as well
    % rake clean 

    # compiles content/* and copies static/* to output/
    % nanoc3 compile

    # runs preview server and autocompile on page refresh
    % nanoc3 aco

Preview the site on `http://localhost:3000`


## Adding Content

Edit the file created by running this command:

    # filename is written to console
    % rake create:article title='Hello world'


## Customizing Existing Content

Edit these two files:

    content/about.md
    content/sticky.md # box content on front page

To change the front page: `content/index.haml`

To change the site layout: `layouts/default.haml`

To style the site:  `content/assets/style.sass`
