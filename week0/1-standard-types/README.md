# Standard Types

Welcome to the first set of problems for week 0. Here are a couple of resources
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

To run the tests for the problems install bundler with `gem install bundler`.

```bash
# This will install all the dependencies for the current set of problems.
bundle install

# To run just the tests.
bundle exec rake test

# To run just the rubocop style validations.
bundle exec rake rubocop

# Runs both the tests and the default style checks.
bundle exec rake
```

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
itself. Bonus points for an outline of proof of why 1 isn't a prime number.
Tip: ask @RadoRado.

```ruby
def prime?(n)
  # Your code goes here.
end

>> prime? 7
=> true
```

### Ordinal

In linguistics, ordinal numbers are words representing position or rank in a
sequential order. The order may be of size, importance, chronology, and so on.
In English, they are adjectives such as 'third' and 'tertiary'.

Ordinal numbers may be written in English with numerals and letter suffixes:
1st, 2nd or 2d, 3rd or 3d, 4th, 11th, 21st, 101st, 477th, etc. In some
countries, written dates omit the suffix, although it is nevertheless
pronounced.

```ruby
def ordinal(n)
  # Your code goes here.
end

>> ordinal 2
=> 2nd

>> ordinal 112
=> 112th
```

See http://en.wikipedia.org/wiki/Ordinal_number_(linguistics)

### Palindrome

A palindrome is a word, phrase, number, or other sequence of symbols or
elements that reads the same forward or reversed, with general allowances for
adjustments to punctuation and word dividers.

```ruby
def palindrome?(object)
  # Your code goes here.
end

>> palindome? 12321
=> true

>> palindome? 'Race car'
=> true
```

### Anagram

An anagram is a type of word play, the result of rearranging the letters of a
word or phrase to produce a new word or phrase, using all the original letters
exactly once; for example Torchwood can be rearranged into Doctor Who.

```ruby
def anagram?(word, other)
  # Your code goes here.
end

>> anagram? 'silent', 'listen'
=> true

>> anagram? 'Mr Mojo Risin', 'Jim Morisson'
=> false
```

### Remove Prefix

Given the string `Ladies Night Out` and the prefix `Ladies `, this operation
should produce the string `Night Out`.


```ruby
def remove_prefix(string, prefix)
  # Your code goes here.
end

>> remove_prefix 'Ladies Night Out', 'Ladies'
=> "Night Out"
```

### Remove Suffix

Given the string `Ladies Night Out` and the suffix ` Night Out`, this operation
should produce the string `Ladies`.


```ruby
def remove_suffix(string, suffix)
  # Your code goes here.
end

>> remove_suffix 'Ladies Night Out', ' Night Out'
=> "Ladies"
```

### Digits

Given the integer `n`, transform it to an array of its digits.

```ruby
def digits(n)
  # Your code goes here.
end

>> digits 12345
=> [1, 2, 3, 4, 5]
```

### Fizz Buzz


Players generally sit in a circle. The player designated to go first says the
number "1", and each player thenceforth counts one number in turn. However, any
number divisible by three is replaced by the word fizz and any divisible by
five by the word buzz. Numbers divisible by both become fizz buzz. A player who
hesitates or makes a mistake is eliminated from the game. For example, a
typical round of fizz buzz would start as follows:

```
1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, Fizz Buzz, 16,
17, Fizz, 19, Buzz, Fizz, 22, 23, Fizz, Buzz, 26, Fizz, 28, 29, Fizz Buzz, 31,
32, Fizz, 34, Buzz, Fizz, ...
```

```ruby
def fizzbuzz(range)
  # Your code goes here.
end

>> fizzbuzz 1..7
=> [1, 2, :fizz, 4, :buzz, :fizz, 7]
```

## Extra Problems

### Count

Given any array, return a hash with the count of every object.

```ruby
def count(array)
  # Your code goes here.
end

>> count [1, 2, 3, 1]
=> {1=>2, 2=>1, 3=>1}

>> count %w(this is an array of words words words)
=> {"this"=>1, "is"=>1, "an"=>1, "of"=>1, "words"=>3}
```

### Count Words

Create a function which counts the words in a variadic list of sentences. There
should be no difference between `Word` and `word`.

```ruby
def count_words(*sentences)
  # Your code goes here.
end

>> count_words "This is a sentance, bro.", "Bro, this is it."
=> {"this"=>2, "is"=>2, "a"=>1, "bro"=>2, "it"=>1}

Bonus, catch words with apostrophes like `won't`.
```

## Easy

Solved the problems already? Try to rewrite them in the minimal amounts of
code, without sacrificing readability.
