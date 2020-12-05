require_relative "00_tree_node"

class KnightPathFinder

    def self.valid_moves(pos)
        
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
          build_move_tree(child)
          node.add_child(child)
        end
    end

end

if __FILE__ == $PROGRAM_NAME
    # 0,0 is top left of board
    kpf = KnightPathFinder.new([0,0])
    p kpf
    p KnightPathFinder.valid_moves([0,0])  #=> [ [2,1], [1,2] ]
end

