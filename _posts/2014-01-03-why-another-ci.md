---
layout: post
title: Why we need another Continuous Integration server
category: robot-sweatshop
comments: true
---

The state of Continuous Integration as of writing is very opinionated. Drone wants Docker virtualization which is a good idea but demands a certain stack. Travis CI is very heavily tied into GitHub and not friendly for self-hosting. Both enforce the idea that 1 repository is linked to 1 build.

While these get most people up and running the CI very quickly, they will provide stumbling blocks over time. They'll restrict your stack, not let you hold your own data, and none of them handle sharded repositories very well. Oddly enough, Jenkins gives the most freedom in this regard but is weighed down by the JVM and outdated application architecture.

## Starting from the ground up

Jenkins provides us with the most freedom because it simply runs scripts you define. A payload comes in, Jenkins unpacks it and runs your scripts with the given information. Whether you're using plugins or not, it all boils down to a glorified script-runner.

Given this, I feel it's time to update our script-runner. We need easy automated deployment to improve DevOps. We need total freedom over what's being run and where the results go. What we need is an MVP look at what a CI server needs to be at its core.

## Building a Robot Sweatshop

Robot Sweatshop aims to be an intuitive, unopinionated CI server.
