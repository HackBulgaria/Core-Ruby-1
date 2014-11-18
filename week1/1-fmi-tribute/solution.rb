class Array
  def to_hash
    result = {}
    each do |key|
      result[key[0]] = key[1] unless key[0].nil?
    end
  result
  end

  def index_by(&code)
    result = {}
    each_with_index do |key|
      result[code.call(key)] = key
    end
    result
  end

  def subarray_count(subarray)
    occurences = 0
    0.upto(self.size - subarray.size) do |x|
     occurences+=1 if self[x..(subarray.size + x - 1)] == subarray
    end
    occurences
  end

  def occurences_count
    result = Hash.new(0)
    string_to_array = self
    string_to_array.each do |key|
    result[key] = string_to_array.count(key) unless result.key? key
    end
    result
  end
end
