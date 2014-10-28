# Vectors

## Vector2D

Implement class named Vector2D with the following interface:

```ruby
class Vector2D
  attr_accessor :x, :y

  # The unit vector (1, 0).
  def self.e
    # Your code goes here.
  end

  # The unit vector (0, 1).
  def self.j
    # Your code goes here.
  end

  def initialize(x, y)
    # Your code goes here.
  end

  def length
    # Your code goes here.
  end

  def magnitude
    # The same as #length. Can we implement it without duplicating or calling
    # the #length method?
  end

  def normalize
    # Your code goes here.
  end

  def ==(vector)
    # Your code goes here.
  end

  def +(vector_or_scalar)
    # Your code goes here.
  end

  def -(vector_or_scalar)
    # Your code goes here.
  end

  def *(scalar)
    # Your code goes here.
  end

  def /(scalar)
    # Your code goes here.
  end

  def to_s
    # Your code goes here.
  end

  def inspect
    # Your code goes here.
  end
end
```

## Vector

Now that we got our hands dirty with classes and vectors, let's implement a
more generic n-dimensional vector. Let's use this vector as the basis for the
implementation of two other vector types.

* `Vector2D` the same vector as above, implemented in terms of `Vector`.
* `Vector3D` similar to `Vector2D`, but has a `z` attribute as well.

The `Vector` interface should be:

```ruby
class Vector
  def initialize(*components)
    # Let's make it more interesting here. I wanna initialize the vector with
    # `Vector.new(1, 2, 3, 4)` and `Vector.new([1, 2, 3, 4])` and expect the
    # same vector.
  end

  def dimension
    # Your code goes here
  end

  def length
    # Your code goes here.
  end

  def magnitude
    # The same as #length. Can we implement it without duplicating or calling
    # the #length method?
  end

  def normalize
    # Your code goes here.
  end

  def [](index)
    # Your code goes here.
  end

  def []=(index)
    # Your code goes here.
  end

  def ==(other)
    # Your code goes here.
  end

  def +(vector_of_same_dimension_or_scalar)
    # Your code goes here.
  end

  def -(vector_of_same_dimension_or_scalar)
    # Your code goes here.
  end

  def *(scalar)
    # Your code goes here.
  end

  def /(scalar)
    # Your code goes here.
  end

  def to_s
    # Your code goes here.
  end

  def inspect
    # Your code goes here.
  end
end
```
