require_relative 'node'
require_relative 'null_node'

class BinarySearchTree
  attr_reader :root_node
  def initialize
    @root_node = NullNode.new
    @count = 0
  end

  def push(data)
    push_no_balance(data)
    balance! if (@count += 1) % 5 == 0 unless balanced?
  end

  def push_no_balance(data)
    @root_node = root_node.push(data)
  end

  def include?(data)
    root_node.include?(data)
  end

  def max_depth
    root_node.max_height
  end

  # def balance!
  #   temp = sort
  #   @root_node = Node.new temp.delete_at temp.length / 2
  #   temp.each { |ele| push_no_balance ele }
  # end

  [:count, :max_height, :to_array, :sort, :min, :max, :post_ordered, :min_height, :balanced?, :balance!].each do |method_name|
    define_method method_name do
      root_node.__send__ method_name
    end
  end
end
