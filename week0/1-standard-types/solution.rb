def histogram(string)
  result = {}
  string_to_array = string.split('')
  string_to_array.each do |key|
    result[key] = string_to_array.count(key) unless result.key? key
  end
  result
end

def prime?(n)
  (n > 2) ? (return 2.upto(Math.sqrt(n)).all? { |x| (n % x).nonzero? }) : (return false)
end

def ordinal(n)
  if n.between?(4, 20)
    return n.to_s + 'th'
  else
    case n % 10
    when 1 then return n.to_s + 'st'
    when 2 then return n.to_s + 'nd'
    when 3 then return n.to_s + 'rd'
      else return n.to_s + 'th'
    end
  end
end

def palindrome?(object)
  object = object.gsub(/[ ,.!]/, '').downcase
  if object.length.even?
    return object[0, object.length / 2] ==
      object[object.length / 2, object.length].reverse
  else
    object[0, object.length / 2] ==
       object[object.length / 2 + 1, object.length].reverse
  end
end

def anagram?(word, other)
  histogram(word.split(' ').join('').downcase) ==
    histogram(other.split(' ').join('').downcase)
end

def remove_prefix(string, pattern)
  string[pattern] = ''
  string
end

def remove_suffix(string, pattern)
  string[pattern] = ''
  string
end

def digits(n)
  n = n.to_s
  digits = Array.new(n.length)
  0.upto(n.length - 1) { |x| digits[x] = n[x].to_i }
  digits
end

def fizzbuzz(range)
  result = []
  range.begin.upto(range.end) do |x|
    if x % 15 == 0 then result << :fizzbuzz
    elsif x % 3 == 0 then result << :fizz
    elsif x % 5 == 0 then result << :buzz
    else result << x
    end
  end
  result
end

def count(array)
  result = {}
  array.each do |key|
    result[key] = array.count(key) if result[key].nil? or array.count(key) == 0
  end
  result
end

def count_words(*sentences)
  test_string = ""
  sentences.each { |sentence| test_string += ' ' + sentence.downcase.gsub(/[-.,!?:']/, '') }
  test_string_array = test_string.split(' ')
  result = {}
  test_string_array.each do |word|
    result[word] = test_string_array.count(word) if result[word].nil? or test_string_array.count(word) == 0
  end
  result
end
