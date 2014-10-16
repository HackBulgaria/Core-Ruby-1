require 'minitest/autorun'

require_relative 'solution.rb'

class HashTest < Minitest::Test
  def test_pick
    assert_equal ( { :a=>1, :b=>2 } ) , ( { :a => 1, :b => 2, :c => 3 }.pick(:a, :b)  )
  end
  
  def test_except
    assert_equal ( { :a => 1, :b => 2, :d => nil }.except(:d) ),  ( { :a=>1, :b=>2 } )
  end
  
  def test_compact_values
    assert_equal ( { a: 1, b: 2, c: false, d: nil }.compact_values ), ( { :a=>1, :b=>2 } )
  end
  
  def test_defaults
    assert_equal ( {a: 1, b: 2 }.defaults(a: 4, c: 3) ),  ( { :a=>1, :b=>2, :c=>3 } )
  end
  
  def test_pick_bang
    h = {:a => 1, :b => 2, :c => 3}
    assert_equal ( h.pick!(:a, :b)  ), ( { :a=>1, :b=>2 } ) 
    assert_equal h, { :a=>1, :b=>2 }
  end
  
  def test_except_bang
    h = {a: 1, b: 2, d: nil}
    assert_equal ( h.except!(:d) ),  ( { :a=>1, :b=>2 } )
    assert_equal h, { :a=>1, :b=>2 }
  end
  
  def test_compact_values_bang
    h = {a: 1, b: 2, c: false, d: nil}
    assert_equal ( h.compact_values! ), ( { :a=>1, :b=>2 } )
    assert_equal h, { :a=>1, :b=>2 }
  end
  
  def test_defaults_bang
    h = {a: 1, b: 2}
    assert_equal ( h.defaults!(a: 4, c: 3) ),  ( { :a=>1, :b=>2, :c=>3 } )
    assert_equal h, { :a=>1, :b=>2, :c=>3 }
  end
  
end
