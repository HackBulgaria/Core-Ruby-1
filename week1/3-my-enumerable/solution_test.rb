require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Test
  class Collection
    include MyEnumerable

    def initialize(*data)
      @data = data
    end

    def each(&block)
      @data.each(&block)
    end
  end

  def test_map
    collection = Collection.new(*1..5)

    assert_equal [2, 3, 4, 5, 6], collection.map(&:succ)
  end

  def test_filter
    collection = Collection.new(*1..10)

    assert_equal [1, 3, 5, 7, 9], collection.filter(&:odd?)
  end

  def test_reject
    collection = Collection.new(*1..10)

    assert_equal [1, 3, 5, 7, 9], collection.reject(&:even?)
  end

  def test_reduce
    collection = Collection.new(*1..10)

    assert_equal 55, collection.reduce(0) { |sum, n| sum + n }
  end

  def test_include?
    collection = Collection.new(*1..10)

    assert_equal true, collection.include?(5)
  end

  def test_any?
    assert_equal (true), ([1, 2, 3, 4, 5, 6].any? {|e| e > 0})
    assert_equal (false), ([1, 2, 3, 4, 5, 6].any? {|e| e < 0})
    assert_equal (true), ([1, 2, 3, 4, 5, 6].any? )
    assert_equal (false), ([false, nil, false].any? )
    assert_equal (true), ([false, nil, false, 1].any? )
  end

  def test_all?
    assert_equal (true), ([1, 2, 3, 4, 5, 6].all? {|e| e > 0})
    assert_equal (false), ([1, 2, 0, 4, 5, 6].all? {|e| e > 0})
    assert_equal (true), ([1, 2, 0, 4, 5, 6].all?)
    assert_equal (false), ([1, false, 0, 4, 5, 6].all?)
  end

  def test_size
    assert_equal 0, [].size
    assert_equal 2, [1, 2].size
    assert_equal 2, [[1, 2, 3], 2].size
    assert_equal 0, Hash.new.size
    assert_equal 2, ( {:a => 1, :b => 2}.size )
  end
end
