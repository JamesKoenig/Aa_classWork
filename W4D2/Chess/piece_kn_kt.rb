require_relative "pieces.rb"

class Knight < Piece
   def symbol
     :KT
   end

    protected
    def move_diffs
        [[2,1], [2,-1], [-2,1], [-2,-1], [1,2], [1,-2], [-1,2], [-1,-2]]
    end

end


class King < Piece
    def symbol
        :KN
    end

    protected
    def move_diffs
        [[1,1],[1,0],[1,-1],[-1,0],[-1,-1],[-1,1],[0,-1],[0,1]]
    end


end