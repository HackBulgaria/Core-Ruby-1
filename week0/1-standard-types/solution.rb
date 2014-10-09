def fizzbuzz(range)
  array = []
  range.each do | element |
    case
    when element % 3 == 0 && element % 5 == 0 then array.push(:fizz_buzz)
    when element % 3 == 0 then array.push(:fizz)
    when element % 5 == 0 then array.push(:buzz)
    else array.push(element)
    end
  end
  array
end

def digits(n)
  array = []
  n.to_s.each_char { |ch| array.push(ch.to_i) }
  array
end

def remove_suffix(string, suffix)
  string.gsub(suffix, '').rstrip
end

def remove_prefix(string, prefix)
  string.gsub(prefix, '').lstrip
end

def anagram?(word, other)
  w = histogram(word)
  o = histogram(other)
  w == o
end

def palindrome?(object)
  str = String.try_convert(object)
  return false if str.nil?
  cleared_str = str.gsub(/[\s]/, '').downcase
  return false if cleared_str.length.even?
  i = 0
  while i < cleared_str.length / 2
    return false if cleared_str[i] != cleared_str[cleared_str.length - 1 - i]
    i += 1
  end
  true
end

def ordinal(n)
  case
  when n % 100 / 10 == 1 then return "#{n}th"
  when n % 10 == 1 then return "#{n}st"
  when n % 10 == 2 then return "#{n}nd"
  when n % 10 == 3 then return "#{n}rd"
  else return "#{n}th"
  end
end

def prime?(n)
  return false if n == 1
  i = 2
  while i < Math.sqrt(n).to_i + 1
    return false if n % i == 0
    i += 1
  end
  true
end

def histogram(string)
  numbers = {}
  string.each_char do | letter |
    if numbers.key?(letter)
      numbers[letter] += 1
    else
      numbers[letter] = 1
    end
  end
  numbers
end
