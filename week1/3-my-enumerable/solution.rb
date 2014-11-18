module MyEnumerables
  def reject
    result_array = []
    each { |element| result_array << element unless yield(element) }
    result_array
  end

  def map
    result_array = []
    each { |element| result_array << yield(element) }
    result_array
  end

  def filter
    result_array = []
    each { |element| result_array << element if yield(element) }
    result_array
  end


  def reduce(initial = nil)
    map { |element| element = yield(element) }
  end

  def any?(&block)
    each { |element| return true if yield(element) }
    false
  end

  def all?(&block)
    each { |element| return false unless yield(element) }
    true
  end

  def each_cons(n, &block)
    return self if n > self.length
    return self.to_enum(:each_cons) unless block_given?
    0.upto(self.length - 1) { |index| yield self[index, n] if self[index, n].length == n }
  end

  def include?(element)
    any? { |item| item == element }
  end

  def count(element = nil, &block)
    return size if element.nil? and not block_given?
    return self.select { |item| item == element }.length unless element.nil?
    self.select { |item| yield item }.length
  end

  def size
    self.length
  end

  def one?(&block)
    if block_given?
      select { |element| element if yield(element).nil? or yield(element) != false }.length == 1
    elsif not block_given?
     select { |element| element if element.nil? or element != false }.length == 1
    else
      false
    end
  end

  def group_by(&block)
    return to_enum(:group_by) unless block_given?
    result_hash = {}
    each { |element| result_hash[yield element] = result_hash[yield element].to_a << element }
    result_hash
  end

  def min(&block)
    return if empty?
    minimum = self[0]
    unless block_given?
      each { |element| minimum = element if element < minimum}
    else
      each { |element| minimum = element if yield(element, minimum) == -1 }
    end
    minimum
  end

  def min_by(&block)
    return to_enum(:min_by) unless block_given?
    minimum = self[0]
    each { |element| minimum = element if yield(element) < yield(minimum) }
    minimum
  end

  def max(&block)
    return if empty?
    maximum = self[0]
    unless block_given?
      each { |element| maximum = element if element > maximum}
    else
      each { |element| maximum = element if yield(element, maximum) == 1 }
    end
    maximum
  end

  def max_by(&block)
    return to_enum(:max_by) unless block_given?
    maximum = self[0]
    each { |element| maximum = element if yield(element) > yield(maximum) }
    maximum
  end

  def minmax(&block)
    return [min, max] unless block_given?
    [min(&block), max(&block)]
  end

  def minmax_by(&block)
    return to_enum(:minmax_by) unless block_given?
    [min_by(&block), max_by(&block)]
  end

  def take(n)
    self[0, n]
  end

  def take_while(&block)
    return to_enum(:take_while) unless block_given?
    truthy_elements_counter = 0
    each do |element|
      if (yield element).nil? or yield(element) == false
        return self[0, truthy_elements_counter]
      else
        truthy_elements_counter += 1
      end
    end
  end

  def drop(n)
    self[n, length - n]
  end

  def drop_while(&block)
    return to_enum(:drop_while) unless block_given?
    falsy_elements_counter = 0
    each do |element|
      if (yield element).nil? or yield(element) == false
        return self[falsy_elements_counter, length - falsy_elements_counter]
      else
        falsy_elements_counter += 1
      end
    end
  end

  def compact
    result_array = []
    each do |element|
      unless element.nil? or element == false
      result_array << element
      end
    end
    result_array
  end

  alias collect map
  alias filter  select
  alias foldl   reduce
end
