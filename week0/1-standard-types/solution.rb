def fizzbuzz(range)
  array = []
  range.each do | element |
    case
    when element % 3 == 0 && element % 5 == 0 then array << :fizz_buzz
    when element % 3 == 0 then array << :fizz
    when element % 5 == 0 then array << :buzz
    else array << element
    end
  end
  array
end

def digits(n)
  array = []
  n.to_s.each_char { |ch| array << ch.to_i }
  array
end

def remove_suffix(string, suffix)
  string.gsub(suffix, '').rstrip
end

def remove_prefix(string, prefix)
  string.gsub(prefix, '').lstrip
end

def anagram?(word, other)
  return false unless word.length == other.length
  histogram(word) == histogram(other)
end

def palindrome?(object)
  s = object.to_s.downcase.gsub(/[\s]/, '')
  s == s.reverse
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
    numbers.key?(letter) ? numbers[letter] += 1 : numbers[letter] = 1
  end
  numbers
end

def count(array)
  objs = {}
  array.each do | e |
    objs.key?(e)  ? objs[e] += 1 : objs[e] = 1
  end
  objs
end

def count_words(*sentences)
  words = {}
  sentences.each do | sentence |     
    many_words = sentence.split(/\W+/)
    many_words.each do | e |
      words.key?(e)  ? words[e] += 1 : words[e] = 1
    end
  end
  words
end

class Array
  
  def to_hash
    hash = {}
    self.each do | e |
      raise 'Each array element must be an array with 2 elements' unless \
        e.instance_of? Array || e.count == 2 
        hash[e[0]] = e[1]
    end
    hash
  end

end
