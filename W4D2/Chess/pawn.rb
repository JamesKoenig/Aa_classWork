require "pieces.rb"
class Pawn

    attr_reader :symbol
    def symbol
        :P 
    end

    def moves #also need to consider between?(0,7)after the move
        all_dir = forward_dir + forward_steps + side_attacks

        i, j = self.pos
        all_moves = []
        all_dir.each do |vector|
            dx, dy = vector
            all_moves << [i+dx, j+dy] if (i+ dx).between?(0,7) && (j+ dy).between?(0,7)
        end
        all_moves
        # if self.at_start_row?
        #     forward_steps + forward_dir
        # elsif #attacking
        #     side_attacks
        # else #not at start row and not attacking
        #     forward_dir
        # end
    end


    private
    def at_start_row?
        self.pos[0] == 0 || self.pos[0] == 7
    end

    def forward_dir
        [[1,0],[-1,0]]
    end

    def forward_steps
        [[2,0],[-2,0]]
    end

    def side_attacks
        [[1,1],[-1,1],[-1,-1],[1,-1]]
    end



end