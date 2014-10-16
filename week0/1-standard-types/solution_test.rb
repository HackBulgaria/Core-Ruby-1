require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Unit::TestCase
  def test_histogram
    assert histogram('abcdd'), 'a' => 1, 'b' => 1, 'c' => 1, 'd' => 2
  end

  def test_prime
    assert_equal true, prime?(23)
    assert_equal false, prime?(4)
    assert_equal false, prime?(1)
    assert_equal true, prime?(3)
  end

  def test_ordinal
    assert_equal '2nd', ordinal(2)
    assert_equal '3rd', ordinal(3)
    assert_equal '12th', ordinal(12)
    assert_equal '512th', ordinal(512)
    assert_equal '523rd', ordinal(523)
  end

  def test_palindrome
    assert_equal true, palindrome?('Race car')
    assert_equal false, palindrome?('race')
    assert_equal true, palindrome?('racerecar')
    assert_equal true, palindrome?("b\ro\nb o\tb")
  end

  def test_anagram
    assert_equal true, anagram?('silent', 'listen')
    assert_equal false, anagram?('Mr Mojo Risin', 'Jim Morisson')
    assert_equal true, anagram?('Mr Mojo Risin', 'Risin Mr Mojo')
    assert_equal true, anagram?('race', 'care')
  end

  def test_remove_prefix
    assert_equal ' silently', remove_prefix('listen silently', 'listen')
    assert_equal ' closely', remove_prefix('listen closely', 'listen')
  end

  def test_remove_suffix
    assert_equal \
      'listen very very ', remove_suffix('listen very very silently', 'silently')
    assert_equal \
      'listen extremely ', remove_suffix('listen extremely closely', 'closely')
  end

  def test_digits
    assert_equal [1, 2, 3], digits(123) 
    assert_equal [6, 1, 5, 2, 3], digits(615_23)
    assert_equal [9, 8, 8, 2], digits(988_2)
  end

  def test_fizzbuzz
    assert_equal [1, 2, :fizz, 4, :buzz, :fizz, 7], fizzbuzz(1..7)
    assert_equal [:fizz, 13, 14, :fizz_buzz, 16, 17, :fizz], fizzbuzz(12..18)
  end
  
  def test_count
     assert_equal count(['a', 2, 3]), 'a' => 1, 2 => 1, 3 => 1
     assert_equal count(['a', 2, 3, 2]), 'a' => 1, 2 => 2, 3 => 1
  end
  
  def test_word_count
  assert_equal count_words("bla bla 'bla drun', da", "uga buga  dwa. dwadaw"), \
    "bla"=>3, "drun"=>1, "da"=>1, "uga"=>1, "buga"=>1, "dwa"=>1, "dwadaw"=>1
  end
  
end
