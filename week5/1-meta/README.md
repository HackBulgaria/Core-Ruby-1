# Meta

To exercise our meta programming let's do some problems!

## Object#singleton_class

In older versions of Ruby, there wasn't `Object#singleton_class`. Let's
implement our own!

## String#to_proc

Symbol#to_proc wasn't around in older Rubies. It came out of Active Support,
the community driven monkey patches used by Ruby on Rails. Let's try to start
another trend by implementing String#to_proc.

Bonus:

Let's make this working:

```ruby
[2, 3, 4, 5].map(&'succ.succ') #=> [4, 5, 6, 7]
```

## Module#private_attr_accessor

Pretty simple, `Module#private_attr_accesssor` should act like
`attr_accessor`, but always create private accessors. Some kids like to access
their data through accessors only. Let them do that.

Of course, you should implement `private_attr_reader` and
`private_attr_writter`. The `protected_*` family as well.

## Proxy

Create a Proxy class, that delegates every method call to its target object.

```ruby
proxy = Proxy.new [1, 2, 3, 4, 5, 6, 7, 8, 9]

proxy.size  #=> 10
proxy.sizes #=> NoMethodError
proxy[0]    #=> 1
proxy & [2] #=> 2

proxy.respond_to? :size #=> true
proxy.respond_to? :zzzz #=> false
```

Bonus:

Make sure it respects `#method_missing` and `#respond_to_missing?` to the
target class.

## FMI

2008 was a great year for Ruby! Check out the [metaprogramming problems], our
friends over FMI gave for that year.

[metaprogramming problems]: http://2008.fmi.ruby.bg/tasks/2.html
