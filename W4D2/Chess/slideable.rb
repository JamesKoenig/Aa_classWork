module Slideable
    HORIZONTAL_DIRS = [[1,0],[-1,0],[0,1],[0,-1]]
    DIAGONAL_DIRS = [[1,1],[-1,-1],[1,-1],[-1,1]]
  

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves 
        #return an array all possible moves that a piece can make

        all_moves = []
        move_dirs.each do |vector|
            dx, dy = vector
            all_moves += grow_unblocked_moves_in_dir(dx, dy)
        end
        all_moves
    end


    private

    def move_dirs
    end
    
    def grow_unblocked_moves_in_dir(dx, dy)
        #takes current position of self and grow in the dx dy direction that is passed in by move_dirs
        #edit this to only grow in one direction
        #will only return the moves withon the board
        i, j = self.pos
        arr = []
        (1..7).each do |n|
            arr <<[i + dx * n, j + dy * n] if (i+ dx * n).between?(0,7) && (j + dy * n).between?(0,7)
        end
        arr
    end
end