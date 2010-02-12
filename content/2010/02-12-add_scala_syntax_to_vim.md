---
created_at: 2010/02/12
excerpt: Add Scala syntax to Vim
kind: article
publish: true
tags: [scala, vim]
title: "Add Scala Syntax to Vim"
_:
---

![vim](/assets/images/blog/scala-on-vim.png)

## Prerequisites

Must have `bash` or equivalent, `svn` and `Vim`.

## Instructions

    # start in a temp directory
    cd tmp

    # get repo without .svn folders
    svn export http://lampsvn.epfl.ch/svn-repos/scala/scala-tool-support/trunk/src/vim vim

    # do not need README for copying
    rm vim/README

    # copy rest of files/directories into .vim
    cp -R vim/* ~/.vim

    # remove downloaded vim source
    rm -rf vim

