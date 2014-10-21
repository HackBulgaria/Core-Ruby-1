module MyEnumerable
  def map
    array = []
    self.each { |el| array << yield(el) } if block_given?
    array 
  end

  def filter
    array = []
    self.each { |el| array << el if yield(el) } if block_given?
    array
  end

  def reject
    array = []
    self.each { |el| array << el unless yield el } if block_given?
    array
  end

  def reduce(initial = nil)
    self.each { |el| initial = yield initial, el } if block_given?
    initial
  end

  def any?
    if block_given?
      self.each { |el| return true if yield el}
    else
      self.each { |el| return true if el }
    end
    return false
  end

  def all?
    if block_given?
      self.each { |el| return false unless yield el }
    else
      self.each { |el| return false unless el }
    end
    return true
  end

  def each_cons(n)
    
  end

  def include?(element)
    self.each {|el| return true if el == element}
    return false
  end

  def count(element = nil)
    cnt = 0
    if element
      self.each { |e| cnt += 1 if element == e }
    else
      self.each { |e| cnt += 1 }
    end
    cnt
  end

  def size
    cnt = 0
    self.each { cnt += 1 }
    cnt
  end
end
