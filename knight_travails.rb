

class Node
  attr_accessor :coordinates, :parent, :children, :visited_coords

  def initialize(coordinates=nil, parent=nil, visited_coords=nil)
    @coordinates = coordinates
    @parent = parent
    @children = []
    @visited_coords = []
    @visited_coords += visited_coords unless visited_coords.nil?
    @visited_coords << coordinates
  end

end

class KnightTravails

  def knight_moves(start, target)
    if (start[0] < 0) || (start[1] < 0) || (start[0] > 8) || (start[1] > 8) ||
      (target[0] < 0) || (target[1] < 0) || (target[0] > 8) || (target[1] > 8)
      return nil
    end

    start_node = Node.new(start)
    queue = []
    queue << start_node
    until queue.empty?
      node = queue.shift
      if node.coordinates == target
        return node.visited_coords
      elsif
        moves = next_moves(node.coordinates, node.visited_coords)
        moves.each do |move_coordinates|
          child = Node.new(move_coordinates, node, node.visited_coords)
          node.children << child
          queue << child
        end
      end
    end
    nil
  end

  private

  def next_moves(coordinates, visited_coords)
    moves = []
    x, y = coordinates

    if (x + 2 <= 7) && (y + 1 <= 7)
      new_coords = [x + 2, y + 1]
      moves << new_coords unless visited_coords.include?(new_coords)
    end

    if (x + 2 <= 7) && (y - 1 >= 0)
      new_coords = [x + 2, y - 1]
      moves << new_coords unless visited_coords.include?(new_coords)
    end

    if (x - 2 >= 0) && (y + 1 <= 7)
      new_coords = [x - 2, y + 1]
      moves << new_coords unless visited_coords.include?(new_coords)
    end

    if (x - 2 >= 0) && (y - 1 >= 0)
      new_coords = [x - 2, y - 1]
      moves << new_coords unless visited_coords.include?(new_coords)
    end

    if (x + 1 <= 7) && (y + 2 <= 7)
      new_coords = [x + 1, y + 2]
      moves << new_coords unless visited_coords.include?(new_coords)
    end

    if (x + 1 <= 7) && (y - 2 >= 0)
      new_coords = [x + 1, y - 2]
      moves << new_coords unless visited_coords.include?(new_coords)
    end

    if (x - 1 >= 0) && (y + 2 <= 7)
      new_coords = [x - 1, y + 2]
      moves << new_coords unless visited_coords.include?(new_coords)
    end

    if (x - 1 >= 0) && (y - 2 >= 0)
      new_coords = [x - 1, y - 2]
      moves << new_coords unless visited_coords.include?(new_coords)
    end

    moves
  end
end

game1 = KnightTravails.new

puts game1.knight_moves([3, 3], [0, 0]).to_s

# start = [3, 3]
# visited_coords = []
# start_node = []
# start_node << Node.new(start, visited_coords)
# #start_node = Node.new(start, visited_coords)

# puts 'Node:'
# puts start_node[0]
# puts 'Coordinates:'
# puts start_node[0].coordinates
# #puts 'visited_coordinates:'
# #puts start_node[0].visited_coords
# puts 'children'
# puts start_node[0].unvisited_child_nodes