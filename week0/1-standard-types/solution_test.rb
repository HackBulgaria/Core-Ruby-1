require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Unit::TestCase
  def test_the_truth
    assert_equal true, true
  end

  def test_histogram
    assert_equal histogram("abraca"), {"a"=>3, "b"=>1, "r"=>1, "c"=>1}
    assert_equal histogram("!@#\$"), {"!" => 1, "@" => 1, "#" => 1, "$" => 1}
    assert_equal histogram("\n\r\a\t"), {"\n" => 1, "\r" => 1, "\a" => 1, "\t" => 1}
    assert_equal histogram('\n\r\a\t'), {'\\' => 4, 'n' => 1, 'r' => 1, 'a' => 1, 't' => 1}
    assert_equal histogram(""), {}
    assert_equal histogram(''), {}
    assert_equal histogram(" "), {" " => 1}
  end
  
  def test_prime
    assert_equal prime?(2), false
    assert_equal prime?(3), true
    assert_equal prime?(4), false
    assert_equal prime?(6461333093), true
    assert_equal prime?(1299721), true
    assert_equal prime?(32416190071), true
  end
  def test_ordinal
    assert_equal "1st", ordinal(1)
    assert_equal "2nd", ordinal(2)
    assert_equal "3rd", ordinal(3)
    assert_equal "4th", ordinal(4)
    assert_equal "9th", ordinal(9)
    assert_equal "11th", ordinal(11)
    assert_equal "21st", ordinal(21)
    assert_equal "12th", ordinal(12)
    assert_equal "22nd", ordinal(22)
    assert_equal "20th", ordinal(20)
    assert_equal "1000000th", ordinal(1000_000)
    assert_equal "12345678905th", ordinal(12345678905)
  end

  def test_palindrome
    assert_equal true, palindrome?("ядох. е, щом си пял, ако има нужда, мини да ги видиш у дома  саксиен демон ръкомаха мокър, но мед не иска само души диви гадини... маджуна ми окаля писмо. ще ходя!")
    assert_equal false, palindrome?("star")
    assert_equal false, palindrome?("foo")
    assert_equal true, palindrome?("Amor, roma")
    assert_equal true, palindrome?("Race car")
    assert_equal true, palindrome?("велев")
    assert_equal true, palindrome?("")
  end

  def test_anagram
    assert anagram?("listen", "silent")
    assert anagram?("Jim Morrison", "Mr Mojo Risin")
    assert anagram?("Shanghai Nobody", "Siobhan Donaghy")
    assert anagram?("Ray Adverb", "Dave Barry")
    assert anagram?("Bryan Walle Proctor", "Barry Cornwall poet")
    assert anagram?("Tobia Gorrio", "Arrigo Boito")
    assert anagram?("", "")
  end

  def test_remove_prefix
    assert_equal 'Night Out', remove_prefix('Ladies Night Out', 'Ladies ')
    assert_equal 'Walle Proctor', remove_prefix('Bryan Walle Proctor', 'Bryan ')
    assert_equal '#$%^', remove_prefix('!@#$%^', '!@')
    assert_equal 'ядохещомс', remove_prefix('ядохещомсипялакоимануждаминидагивидишудомасаксиендемонръкомахамокърномеднеискасамодушидивигадинимаджунамиокаляписмощеходя', 'ипялакоимануждаминидагивидишудомасаксиендемонръкомахамокърномеднеискасамодушидивигадинимаджунамиокаляписмощеходя')
    assert_equal '', remove_prefix('', '')
  end

  def test_remove_suffix
    assert_equal 'Ladies', remove_suffix('Ladies Night Out', ' Night Out')
    assert_equal 'Bryan Walle', remove_suffix('Bryan Walle Proctor', ' Proctor')
    assert_equal '!@#$', remove_suffix('!@#$%^', '%^')
    assert_equal 'ядохещомсипялакоимануждаминидагивидишудомасаксиендемонръкомахамокърномеднеискасамодушидивигадинимаджунамиокаляписм', remove_suffix('ядохещомсипялакоимануждаминидагивидишудомасаксиендемонръкомахамокърномеднеискасамодушидивигадинимаджунамиокаляписмощеходя', 'ощеходя')
    assert_equal '', remove_suffix('', '')
  end

  def test_digits
    assert_equal [1, 2, 3, 4, 5], digits(12345)
    assert_equal [0], digits(0)
    assert_equal [1, 2, 3 ,4, 5, 6, 7, 8, 9, 0], digits(1234567890)
    assert_equal [1, 2, 3 ,4, 5, 6, 7, 8, 9, 0], digits(1_234_567_890)
  end

  def test_fizzbuzz
    assert_equal fizzbuzz(1..1), [1]
    assert_equal fizzbuzz(3..3), [:fizz]
    assert_equal fizzbuzz(5..5), [:buzz]
    assert_equal fizzbuzz(15..15), [:fizzbuzz]
    assert_equal fizzbuzz(1..7), [1, 2, :fizz, 4, :buzz, :fizz, 7]
    assert_equal fizzbuzz(8..36), [8, :fizz, :buzz, 11, :fizz, 13, 14, :fizzbuzz, 16, 17, :fizz, 19, :buzz, :fizz, 22, 23, :fizz, :buzz, 26, :fizz, 28, 29, :fizzbuzz, 31, 32, :fizz, 34, :buzz, :fizz]

  end

end
