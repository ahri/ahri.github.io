---
layout: post
title: "upubsub - A micro pub/sub implementation for nodejs"
description: ""
category: ""
tags: []
---
{% include JB/setup %}

So I built my own PubSub...

&lt;dramatic pause awaiting shouts of "Not Invented Here syndrome!"&gt;

heh. So I did this as a product of my need for an eventing system for one of my
secret side-projects, built using the CQRS and Event-Sourcing paradigms, for
which I needed a simple pubsub as my output. This grew slightly when I
implemented a simple Event Store and needed to latch onto all of the events that
pass through the system.

In my case I have no need of a topic-based approach or clever error-handling.
I've not even considered Promises and I don't want to think about NodeJS vs.
Browser Compatibility. It's all very interesting stuff but I need to stay
focused if I'm ever to finish what I'm doing, and of course if my requirements
evolve past the abilities of my simple little pubsub I'll be more than happy to
swap to a 3rd-party library.

For now I have a nice little pubsub that dispatches in an async manner, and does
as little clever stuff as possible. It's available from my
[github](github.com/ahri/upubsub) and [npm](npmjs.org/package/upubsub) and
weighs in at 4534534554 loc and 4553454354534 bytes. If you want to use it in a
browser it'll need to be run through [browserify](browserify.org).
