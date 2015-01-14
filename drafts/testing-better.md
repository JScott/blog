Writing tests always seems like a hot topic among developers. There's undeniable benefit almost immediately from doing [Test Driven Development](http://en.wikipedia.org/wiki/Test-driven_development) (TDD) but there's considerable work involved. It's a habit that needs to be trained, a separate collection of skills and frameworks to learn, and is often perceived as "extra" work that's "nice to have". We've found real value in automated tests but the implementation has room for improvement.

I think it's worth a closer look at the tools we use to test our code. Maybe it's partially a matter of how our generation was taught to code but the mere fact that it isn't intuitive strikes me as odd. Instead of assuming it'll fix itself as our tools [evolve][1], I want to inspect how we could be approaching it from different angles.

# Scaffolding Tests

One thing that I don't think has been explored enough is automatic generation of unit tests. Functional tests usually guide design and require human input but unit tests have value as well.
https://github.com/locochris/rdd

# Ruby is as Ruby does

RubySpec was an attempt to create a centralized repository of tests that all Ruby interpreters should follow. It was shut down when Brian Shirai was [oddly upset](http://rubini.us/2014/12/31/matz-s-ruby-developers-don-t-use-rubyspec/) that the Ruby dev team didn't follow his tests. This enforces that there is only one canonical resource of what the specification of Ruby is: Matz's Ruby Interpreter (MRI).

When MRI changes, Ruby specs have changed. Cutely put, Ruby is as Ruby does.

If we apply this paradigm to our own code then it presents an interesting idea. The only way to test your code is to see what your code _does_ at runtime and compare it to previous versions. If we had a reliable metric for what our application does then we could diff those metrics and see what changed from a version we declare is "correct".

This metric isn't too hard to imagine. What your code does can be helpfully summarized by the inputs and outputs of your methods. With metaprogramming we can capture what methods are called and capture their input and output as a black box. Taking this a step further, we could track those outputs to see what methods are called on them. This is important with dynamically typed languages that rely on duck typing.

## An example

These metrics might show us that `test_method` always gets passed two Strings and outputs a Hash that must respond to `puts`. In my most recent update it might tell me that it now expects to respond to `to_sym`. This is a problem because Hash doesn't do that so I either need to debug the input to fix the function or stop relying on `to_sym`.

## Precedent

This idea has a lot of parallels with [pdiff](http://mattjibson.com/blog/2013/06/11/perceptual-diffs-at-stack-overflow/), a relatively new testing metric. It doesn't tell you if your changes are "correct" but rather provides you a log to make that decision yourself. Likewise, this method-tracking concept in code provides you with a log that helps you decide if your code had any unintended side-effects.


[1]: e.g. xUnit becomes rspec becomes cucumber
