class Node
  attr_reader :data, :left, :right
  def initialize(data, left = NullNode.new, right = NullNode.new)
    @data, @left, @right = data, left, right
  end

  def push(datta)
    data >= datta ? insert_left(datta) : insert_right(datta)
    self
  end

  def max_height
    1 + [left.max_height, right.max_height].max
  end

  def min_height
    1 + [left.min_height, right.min_height].min
  end

  def insert_left(datta)
    @left = left.push(datta)
  end

  def insert_right(datta)
    @right = right.push(datta)
  end

  def count
    1 + left.count + right.count
  end

  def include?(datta)
    return true if datta == data
    data >= datta ? left.include?(datta) : right.include?(datta)
  end

  def to_array
    [data] + left.to_array + right.to_array
  end

  def sort
    left.sort + [data] + right.sort
  end

  def min
    left.min.nil? ? data : left.min
  end

  def max
    right.max.nil? ? data : right.max
  end

  def balanced?
    max_height - min_height < 2
  end

  def balance!
    temp = sort
    initialize temp.delete_at temp.length / 2
    temp.each { |ele| push ele }
    right.balance!
    left.balance!
  end

  def post_ordered
    left.post_ordered + right.post_ordered + [data]
  end
end
