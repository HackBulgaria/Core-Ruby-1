require 'minitest/autorun'
require 'rubocop'
require_relative 'solution'
require 'irb'

class SolutionTest < Minitest::Unit::TestCase
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

  def test_count
    assert_equal count([1, 1, 9, 4, 78, 13, 6, 5, 9, 11, 1, 9, 7, 16, 51, 9, 18]), { 1 => 3, 4 => 1, 5 => 1, 6 => 1, 7 => 1, 9 => 4, 11 => 1, 13 => 1, 16 => 1, 18 => 1, 51 => 1, 78 => 1}
    assert_equal count([1, 2, 3, 1]), {1=>2, 2=>1, 3=>1}
  end

  def test_count_words
    assert_equal count_words("How many words", "can be found", "in this sentence?", "And what about this one?", "Don't forget the next one:", "Why me?", "Because it's a test", "It's not a game!"), {"how" => 1, "many" => 1, "words" => 1, "can" => 1, "be" => 1, "found" => 1, "in" => 1, "this" => 2, "sentence" => 1, "and" => 1, "what" => 1, "about" => 1, "one" => 2, "dont" => 1, "forget" => 1, "the" => 1, "next" => 1, "why" => 1, "me" => 1, "because" => 1, "its" => 2, "a" => 2, "test" => 1, "not" => 1, "game" => 1 }
    assert_equal count_words("This is a sentence, bro.", "Bro, this is it."), {"this"=>2, "is"=>2, "a"=>1, "bro"=>2, "it"=>1, "sentence"=>1}
  end

end
