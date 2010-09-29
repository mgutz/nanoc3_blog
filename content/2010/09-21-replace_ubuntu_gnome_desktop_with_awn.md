---
created_at: 2010-09-21
excerpt: Screencast on how to replace Gnome panels with AWN
kind: article
publish: true
tags: [ubuntu, customizing]
title: "Replace Ubuntu Gnome Panels With AWN"
---

<object width="720" height="430"><param name="movie" value="http://www.youtube.com/v/XK_RFHbM9aw?fs=1&amp;hl=en_US&amp;rel=0"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/XK_RFHbM9aw?fs=1&amp;hl=en_US&amp;rel=0" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="720" height="430"></embed></object>

(NO, I don't know what he's singing. Just sounded off the wall and funny.)

After all these years Ubuntu still _looks_ like a Windows XP wannabe hobby OS. Apple gets it. Simple is sexy. Are you listening Ubuntu design team? Even the Windows
design team stopped using crayons to design interfaces. In truth I know Ubuntu is a 
powerful OS which I use daily to code the next big startup.

In this screencast, I replace Gnome panels with Avant Window Navigator (AWN) 
and my custom Nub Metacity theme.


## Avant Window Navigator

Install latest AWN:

    sudo add-apt-repository ppa:awn-testing/ppa && sudo apt-get update
    sudo apt-get install avant-window-navigator-trunk

To use AWN only:

    gconftool-2 -s /desktop/gnome/session/required_components/panel -t string "avant-window-navigator"

To revert back to Gnome panels:

    gconftool-2 -s /desktop/gnome/session/required_components/panel -t string "gnome-panel"

Be sure to add "Yet Another Menu Applet" to AWN dock to get Ubuntu's start menu.

## Make it Shiny 

Compositing is needed to get nice shadow effects on windows as well as enhance
the look of AWN and Gnome-Do.

To turn on:

    gconftool-2 -s /apps/metacity/general/compositing_manager -t bool 1

To turn off:

    gconftool-2 -s /apps/metacity/general/compositing_manager -t bool 0


## Complete the Look

Faenza Icons

    sudo add-apt-repository ppa:tiheum/equinox
    sudo apt-get update && sudo apt-get install faenza-icon-theme


Install my lightweight [Nub Metacity Theme](http://gnome-look.org/content/show.php/Nub?content=132722)

## Faster Launching

Install Gnome-Do

	sudo apt-get install gnome-do
