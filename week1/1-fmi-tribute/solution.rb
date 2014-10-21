class Array
  def to_hash
    reduce({}) { | r, s | r.merge!(s[0] => s[1]) }
  end

  def index_by(&block)
    reduce({}) { | memo, e | memo.merge!(block.call(e) => e) }
  end

  def subarray_count(subarray)
    cnt = 0
    each_cons(subarray.length) { | e | cnt += 1 if e == subarray }
    cnt
  end

  def occurences_count
    objs = {}
    each { | e | objs.key?(e)  ? objs[e] += 1 : objs[e] = 1 }
    objs
  end
end
