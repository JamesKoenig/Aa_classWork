require_relative "00_tree_node"

class KnightPathFinder

    def self.valid_moves(pos)
        pos_x, pos_y = pos
        base_moves   = [ [ 2, 1], [ 1, 2],
                         [-2, 1], [ 1,-2],
                         [ 2,-1], [-1, 2],
                         [-2,-1], [-1,-2] ]

        all_potential_moves = base_moves.map do |base_x,base_y|
                                [base_x+pos_x,base_y+pos_y]
                              end

        # reject any where either coordinate is greater than 7 or less than 0
        all_potential_moves.reject do |move|
          move.any? { |xy| xy < 0 || xy > 7 }
        end
    end

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = []
        build_move_tree(@root_node)
    end

    def new_move_positions(pos)
        new_positions = KnightPathFinder.valid_moves(pos)
        valid_positions = new_positions.reject { |pos| @considered_positions.include?(pos) }
        @considered_positions += valid_positions
        valid_positions
    end

    def build_move_tree(node)
        new_moves = new_move_positions(node.value)
        new_moves.each do |move|
            child = PolyTreeNode.new(move)
            node.add_child(child)
        end
        node.children.each { |child| build_move_tree(child) }
    end

    def find_path(end_pos)
        end_node = @root_node.bfs(end_pos)
        return trace_path_back(end_node)
    end

    def trace_path_back(node)
        current = node
        result = [node.value]
        while current != @root_node
            current = current.parent
            result.unshift(current.value)
        end
        result
    end

end

if __FILE__ == $PROGRAM_NAME
    # 0,0 is top left of board
    kpf = KnightPathFinder.new([0,0])
    # p kpf
    # p KnightPathFinder.valid_moves([0,0])  #=> [ [2,1], [1,2] ]
    p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
    p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
end

