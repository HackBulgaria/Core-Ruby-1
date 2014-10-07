# Week 1

Welcome to the first set of problems for week 1. Here are a couple of resources
you may find useful, while digging into them:

* http://www.ruby-doc.org/core-2.1.3/Array.html
* http://www.ruby-doc.org/core-2.1.3/Hash.html
* http://www.ruby-doc.org/core-2.1.3/String.html

If you don't feel confident with the building blocks yet, a couple of lessons
on http://tryruby.org/ can help you digest the above documentation better.

## Solutions

The file to write your solutions in is called `solutions.rb`. For the following
problems, you need to define several methods.

A boilerplate of a test file is provided in `solution_test.rb`. You can write
your tests there and work your way in a TDD fusion.

The workflow is write a test. See it fail. Write a solution that makes it pass.
Then repeat for as many corner cases you can think of and move to the next
problem.

We'll help you with that on the spot, if you don't get it now, don't worry.

## Problems

### Histogram

Create a histogram with each character and the number of its occurrences in
arbitrary string.

```ruby
def histogram(string)
  # Your code goes here.
end

>> histogram "abraca"
=> {"a"=>3, "b"=>1, "r"=>1, "c"=>1}
```

### Prime

A prime number is any integer greater than 1 that is divisible only by 1 and
itself.

Bunus points for an outline of proof of why 1 isn't a prime number. Tip: ask
@RadoRado.

```ruby
def prime?(n)
  # Your code goes here.
end

>> prime? 7
=> true
```
