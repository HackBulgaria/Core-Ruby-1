# Simple Test

The Ruby community cares for testing. There is a valid reason behind it - it
creates better software and happier, more confident developers.

Let's create our own [xUnit](http://en.wikipedia.org/wiki/XUnit) compatible
testing framework.

## Interface

We should create a gem called simpletest. Create it as an own git repo in
your GitHub account.

## SimpleTest

The top namespace for your framework should be a module named `SimpleTest`.

## SimpleTest::Test

The class `SimpleTest::Test` should represent a test case. It should include
a module named `SimpleTest::Assertions` and define the following class
methods.

### SimpleTest::Test.test

Defines a test method. A test method is an instance method that begins with
`test_`. This is sugar on top of it, so we can write tests like that:

```ruby
class RequestTest < SimpleTest::Test
  test 'it represent a networ request' do
    assert true
  end
end
```

### SimpleTest::Test.xtest

Defines a test method that will be skipped for now. Useful if you commit a
test, that's still unused or incomplete.

### SimpleTest::Test.setup

Defines a setup step to be executed before any test method run.

```ruby
class RequestTest < SimpleTest::Test
  setup do
    ensure_database_is_created
  end

  test 'that requires database' do
    # ...
  end
end
```

### SimpleTest::Test.teardown

Defines a tear down step to be executed after any test method run.

```ruby
class RequestTest < SimpleTest::Test
  setup do
    ensure_database_is_created
  end

  teardown do
    close_database_connection
  end

  test 'that requires database' do
    # ...
  end

  test 'another test that requires database' do
    # ...
  end
end
```

### SimpleTest::Test#setup

An instance method called before any test method run.

### SimpleTest::Test#teardown

An instance method called after any test method run.

### SimpleTest::Test#fail

Fails the current test.

### SimpleTest::Test#pending

Marks the current test method as pending. A pending method doesn't fail a
test run.

### SimpleTest::Test#skip

Skips the current test method.

## SimpleTest::Assertions

A module to be mixed into `SimpleTest::Test` that holds all of our assertion
methods.


### SimpleTest::Assertions#assert

Asserts whether a condition is met. Raises SimpleTest::AssertionError if the
assertion isn't met. Can have an

```ruby
test 'the truth' do
  assert true, "This is the truth yo, if its false we're doomed"
end
```

### SimpleTest::Assertions#assert_not

Asserts whether a condition is unmet. The opposite of #assert.

```ruby
test 'the lie' do
  assert_not false, "This is THE lie"
end
```

### SimpleTest::Assertions#assert_equal

A nicer version of #assert. Instead of just telling you that an assertion
wasn't met, it should tell you that it wasn't met because we expected it to
be of _this_ value.

```ruby
test 'the truth' do
  assert true, something_that_is_truthy
end
```
### SimpleTest::Assertions#assert_true

Asserts whether a condition is exactly the value `true`.

### SimpleTest::Assertions#assert_false

Asserts whether a condition is exactly the value `false`.

### SimpleTest::Assertions#assert_nil

Asserts whether a condition is exactly the value `nil`.

### SimpleTest::Assertions#assert_is_a

Asserts whether a condition is results in on object that is #is_a? another
one.

### SimpleTest::Assertions#assert_kind_of

An alias of #assert_is_a.

### SimpleTest::Assertions#assert_instance_of

Asserts whether a condition is results in on object that is #instance_of?
another one.

### More

SimpleTest::Assertions#assert_raises
SimpleTest::Assertions#assert_not_raises

SimpleTest::Assertions#assert_include, SimpleTest::Assertions#assert_contains
SimpleTest::Assertions#assert_length, SimpleTest::Assertions#assert_size, SimpleTest::Assertions#assert_count

## SimpleTest::Runner

Once we have test cases, we have to be able to run them. The whole purpose of this class is to find them.

## SimpleTest::TextReporter

A text reporter should create a report after all the test cases have been
run. Think the dots you currently see when you run your test cases.

## SimpleTest::HtmlReporter

An HTML reporter should create a report in HTML form after all the test cases
have been run.

## Bonus

Test the test framework with the test framework.
