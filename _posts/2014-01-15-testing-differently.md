---
layout: post
title: Testing differently
category: canon
comments: true
---

Writing tests is always a hot topic among developers. There's undeniable, immediate benefit from doing [Test Driven Development](http://en.wikipedia.org/wiki/Test-driven_development) (TDD) but there's also significant work involved. It's a habit that needs training, a separate collection of skills and frameworks to learn, and is often dismissed as "extra" work that's "nice to have". There's real value in automated tests but the current implementations have room for improvement.

Because of this, it's worth a closer look at a different tool to test our code. We could blame other factors but I'm concerned that our tools don't feel as intuitive as they could be. Through discussions with [Chris Olstrom](github.com/colstrom), we've come up with a new approach that could offer another piece of the puzzle.

To explain it, I'd like to start with the context and history that led up to it.

## Ruby is as Ruby does

RubySpec tried to create a centralized repository of tests that all Ruby interpreters should follow. Brian Shirai discontinued the project when he was [oddly upset](http://rubini.us/2014/12/31/matz-s-ruby-developers-don-t-use-rubyspec/) that the Ruby dev team didn't follow his tests. Wherever you stand on the issue, this makes it clear that the behaviour of Matz's Ruby Interpreter (MRI) is the only canonical Ruby specification.

If MRI functionality changes then the Ruby specs have changed. Cutely put, Ruby is as Ruby does.

This is an interesting concept that we can apply to anything written in a dynamically typed language that doesn't precompile. In terms of testing, we have to measure what the code *does* at runtime instead of what we *expect* it to do. If we had a reliable metric for our application's execution then we could compare it to the last "correct" version and see what changed.

This metric isn't too hard to imagine. You can summarize what your code does by the inputs and outputs of your methods. Since this group of languages makes use of [duck typing](http://en.wikipedia.org/wiki/Duck_typing), we can tell a lot from what the returned object is expected to respond to.

### An example

Imagine that these metrics tell me that my `foo_method` always gets passed a `String` and outputs a `Hash` that must respond to `puts`. Then I update my code and it now tells me my custom `parse_array` method gets called on the output as well. Now I know that I've unexpectedly broken my object chain and I have to fix my code.

### So what?

There's a lot you can do with this metric. You can auto-generate primitive unit tests. You can create reports for code as [pdiff](http://mattjibson.com/blog/2013/06/11/perceptual-diffs-at-stack-overflow/) does for rendering. You could even automate documentation that updates itself. It won't pass or fail but it'll give you new insights to improve your code.

## Prototype

Ruby's recent additions to metaprogramming make gathering this information possible. Chris and I are working on [a gem](https://github.com/colstrom/self_identity) to add this reporting to your code. If it's as useful as we hope, we'd like to port if to other languages as well. Stay tuned for more updates!
