---
title: HostGator and Rails
kind: article
tags: [rails, hosting]
created_at: 2010/02/03
excerpt: Why I Switched to HostGator 
publish: false
---

Googling for honest opinions on web hosting is a craps shoot. I have a feeling each company or more likely their resellers hire commenters to write negative reviews about each other.

I used SiteGround until recently despite the negative reviews. Siteground provided a good service for the $6/month I was charged for the last two years. I switched hosts looking for one with Rails support. My experience with SiteGround was good. 

I switched to HostGator. There are plenty of negative reviews about HostGator too. The decision ultimately came down to HostGator offering Rails hosting + jailed SSH access. Would I run a heavily trafficed site on HostGator baby plan? Probably not. The Rails support looks good enough for demo purposes and the SSH access is a big plus!

Here are the binary versions from my SSH session:

- Centos 5.?
- Mysql 5.1.30
- Ruby 1.8.7p22
- gem 1.3.5
- Rails 2.3.5

HostGator is working on Passenger support so that means someday any Rack-based app (Sinatra!) can be deployed. I will chronicle my HostGator + Rails deployment adventures. From what I have read in the forums, some have been successful using Capistrano.
