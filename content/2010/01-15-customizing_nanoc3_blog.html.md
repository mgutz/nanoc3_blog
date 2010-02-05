---
title: Customizing This Starter Kit
kind: article
tags: [misc]
created_at: 2010/01/15
---

## Installation

From the command line

    % gem install rack rake mime-types nanoc3 haml bluecloth
    % git clone git://github.com/mgutz/nanoc3_blog.git your_blog

## Configuration

Edit
the
configuration
files:

    config.yaml
    content/atom.xml.erb

## Previewing the Site

Compile the site

    # clean output directories
    % rake clean 

    # compile the site
    % nanoc3 compile

    # autocompile the site. any edit to a file is previewable automatically.
    % nanoc3 aco

Preview the site

    http://localhost:3000

## Adding Content

Copy any of the files in `content/2010` and edit.  Use a date later than `01-18` and it will appear as the first post in your blog.

