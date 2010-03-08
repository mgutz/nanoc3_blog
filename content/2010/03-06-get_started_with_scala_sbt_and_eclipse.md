---
created_at: 2010/03/06
excerpt: Screencast on how to get started with the Scala programming language using simple-build-tool (sbt) and Eclipse
kind: article
publish: true
tags: [scala]
title: "Get Started With Scala, Sbt And Eclipse"
---

<div class="screencast">
    <div><embed src="http://blip.tv/play/hasFgcucKAA" type="application/x-shockwave-flash" width="640" height="390" allowscriptaccess="always" allowfullscreen="true"></embed></div>
    <div>Toggle fullscreen for clearer text.</div>
</div>

Getting started with any programming language is a daunting task, let alone
getting your workstation in a state to create a non-trivial
application. I spent a few days reading and trying many Scala tools and libraries.

This screencast covers how to create a `Scala` console-based project.
I use the simple-build-tool (`sbt`) to compile, run, test and and then eclipsify
a project. I briefly cover where to put source code, tests and how to edit
and debug the project within the Eclipse IDE.

## Preqrequisites

This must be installed

- [simple-build-tool (sbt)](http://code.google.com/p/simple-build-tool/)

These are optional

- [git](http://git-scm.com/download) is not required. The source code may be downloaded as an archive.
- [Eclipse 3.5.2](http://www.eclipse.org/downloads/)
- [scala-ide plugin](http://www.scala-lang.org/node/94)



## Steps

0. Clone OR download/extract source from [sbt-console-template](http://github.com/mgutz/sbt-console-template)
1. From `sbt` console

        # update dependencies
        > update
    
        # run project
        > run
    
        # test project continuously
        > ~test
        
        # eclipsify
        > eclipse

## Credits

Thanks to all those in the prerequisites. Here is other good stuff used.

- [OH MY ZSHELL!](http://github.com/robbyrussell/oh-my-zsh)
- [SbtEclipsify](http://github.com/musk/SbtEclipsify)
- [Scalatest](http://www.scalatest.org/)
- [MacVim](http://code.google.com/p/macvim/)

