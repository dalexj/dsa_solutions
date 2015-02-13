class Pathfinder
  COST_HASH = {" " => 1, "G" => 5, "s" => 3, "S" => 0, "F" => 0}

  def solve(landscape)

    visited_locs = []
    queue = [Node.new(*landscape.start)]
    curr_node = [-1,-1]

    end_node = Node.new(*landscape.finish)

    until end_node.coords_next_to.include? curr_node.to_a
      curr_node = queue.shift
      curr_node.set_neighbors(landscape)
      queue += curr_node.neighbors.reject { |coord| visited_locs.include? coord.to_a }
      visited_locs << curr_node.to_a
      queue.sort_by! { |node| node.full_cost(landscape) }
    end

    curr_node.full_tree
  end
end

class Node
  attr_reader :x, :y, :from, :neighbors
  def initialize(x, y, from = nil)
    @x, @y, @from = x, y, from
  end

  def full_tree
    from ? from.full_tree + [to_a] : []
  end

  def to_a
    [x, y]
  end

  def set_neighbors(landscape)
    @neighbors = nodes_next_to.reject { |node| landscape.at(*node.to_a) == "#" }
  end

  def coords_next_to
    [[x - 1, y], [x + 1, y], [x, y - 1], [x, y + 1]]
  end

  def nodes_next_to
    coords_next_to.map { |cords| Node.new(*cords, self) }
  end

  def cost(landscape)
    @cost ||= Pathfinder::COST_HASH.fetch landscape.at(*to_a)
  end

  def full_cost(landscape)
    from ? from.full_cost(landscape) + cost(landscape) : cost(landscape)
  end
end
