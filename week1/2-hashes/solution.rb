ss Hash
  def pick(*keys)
    self.dup.pick!(*keys)
  end

  def pick!(*keys)
    self.keep_if { |key| keys.include? key }
  end

  def except(*keys)
    self.dup.except!(*keys)
  end

  def except!(*keys)
    self.delete_if { |key| keys.include? key }
  end

  def compact_values()
    self.dup.compact_values!()
  end

  def compact_values!()
    self.delete_if { |key, value|  value.nil? or value == false }
  end

  def defaults(hash)
    hash.except(self.keys.to_a).merge(self)
  end

  def defaults!(hash)
    self.replace(self.defaults(hash))
  end
end

class Array
  def exclude_subarray(subarray)
    array_hash = Hash[*self.group_by { |el| el }.flat_map { |k, v| [k, v.size] }]
    subarray_hash = Hash[*subarray.group_by { |el| el }.flat_map { |k, v| [k, v.size] }]
    array_hash.each { |key, value| array_hash[key] -= subarray_hash[key] unless subarray_hash[key].nil? }
  end

  def exclude_subarray_light(subarray)
    result_array = self.dup
    self.select { |element| result_array.delete_at(self.find_index(element)) if subarray.include? element}
    result_array
  end
end
