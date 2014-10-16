class Array
  def exclude?(element)
    return false if self.include?(element)
    true
  end
end

class Hash
  def pick!(*keys)
    reject! { | k, v | keys.exclude?(k) }
  end
  
  def pick(*keys)
    self.dup.pick!(*keys)
  end
  
  def except!(*keys)
    reject! { | k, v | keys.include?(k) }
  end
  
  def except(*keys)
    self.dup.except!(*keys)
  end
  
  def compact_values!
    reject! { | k, v | v .is_a?(FalseClass) || v.nil?}
  end
  
  def compact_values
    self.dup.compact_values!
  end
  
  def defaults!(hash)
    self.merge!(hash.merge(self))
  end
  
  def defaults(hash)
    self.dup.defaults!(hash)
  end
  
end
