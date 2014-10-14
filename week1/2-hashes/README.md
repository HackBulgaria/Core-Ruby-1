# FMI

How can I follow those FMI problems, heh? Watashi wa besuto o tsukushimasu!

## Resources

Enumerable is a gem. Go through its documentation. Hash builds on top of it.

* http://www.ruby-doc.org/core-2.1.3/Enumerable.html
* http://www.ruby-doc.org/core-2.1.3/Hash.html

## Problems

### Hash#pick

Hash#pick returns a new hash, with only the specified keys in it.

```ruby
class Hash
  def pick(*keys)
    # Your code goes here.
  end
end

>> {a: 1, b: 2, c: 3}.pick(:a, :b)
=> {:a=>2, :b=>3}
```

### Hash#except

Hash#except returns a new hash, without the specified keys in it.

```ruby
class Hash
  def except(*keys)
    # Your code goes here.
  end
end

>> {a: 1, b: 2, d: nil}.except(:d)
=> {:a=>2, :b=>3}
```

### Hash#compact_values

Hash#compact_values returns a new hash, with only the truthy keys in it.

```ruby
class Hash
  def compact_values
    # Your code goes here.
  end
end

>> {a: 1, b: 2, d: nil}.compact_values
=> {:a=>2, :b=>3}
```

[@skanev]: http://github.com/skanev
[@mitio]: http://github.com/mitio
