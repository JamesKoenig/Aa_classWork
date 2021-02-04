
class Rook < Piece
    include Slideable
    def symbol
        :R
    end

    private
    def move_dirs
        horizontal_dirs
    end

    
end

class Bishop < Piece
    include Slideable
    def symbol
        :B
    end

    private
    def move_dirs
        diagonal_dirs
    end
   
end

end

class Queen < Piece
    include Slideable

    def symbol
        :Q
    end

    private
    def move_dirs#return unit steps
        horizontal_dirs + diagonal_dirs
    end
end

