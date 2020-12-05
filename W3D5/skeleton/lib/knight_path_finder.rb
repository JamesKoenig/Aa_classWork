require_relative "00_tree_node"

class KnightPathFinder

    def self.valid_moves(pos)
        
    end

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = []
        build_move_tree


    end

    def new_move_positions(pos)
        new_positions = KnightPathFinder.valid_moves(pos)
        valid_positions = new_positions.reject { |pos| @considered_positions.include?(pos) }
        @considered_positions += valid_positions
        valid_positions
    end

    def build_move_tree
        node = @root_node
        new_moves = new_move_positions(node.value)
        until new_moves == []
            
        end
    end

end

if __FILE__ == $PROGRAM_NAME
    # 0,0 is top left of board
    kpf = KnightPathFinder.new([0,0])
    p kpf
    p KnightPathFinder.valid_moves([0,0])  #=> [ [2,1], [1,2] ]
end