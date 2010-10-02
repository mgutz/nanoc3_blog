---
created_at: 2010-09-28
excerpt: How to install latest GTK2 Murrine engine
kind: article
publish: true
tags: [ubuntu, gnome, customizing]
title: "How To Install Gtk2 Murrine Engine"
---

I have not found a PPA for Ubuntu 10.04 that has the latest GTK2 Murrine 0.98 engine. Follow these
steps to build Murrine. (should work with any Gnome distro)

Copy, paste and execute each line in a terminal. Good idea to start in a temp directory.

    sudo apt-get install build-essential libgtk2.0-dev intltool
    wget http://ftp.acc.umu.se/pub/GNOME/sources/murrine/0.98/murrine-0.98.0.tar.bz2
    tar xfj murrine-0.98.0.tar.bz2
    cd murrine-0.98.0
    ./configure --prefix=/usr --enable-animation
    make
    sudo make install

Log Out/Log In to start with new session. 
