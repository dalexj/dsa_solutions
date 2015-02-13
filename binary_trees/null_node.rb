class NullNode
  def push(data)
    Node.new(data)
  end

  def count
    0
  end

  def include?(data)
    false
  end

  def max_height
    0
  end

  def to_array
    []
  end

  def sort
    []
  end

  def min
    nil
  end

  def max
    nil
  end

  def min_height
    0
  end

  def balanced?
    true
  end

  def balance!
  end

  def post_ordered
    []
  end
end
