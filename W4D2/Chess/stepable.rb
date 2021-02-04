module Steplable


    def moves
        i, j = self.pos
        all_moves = []
        move_diffs.each do |vector|
            dx, dy = vector
            all_moves << [i+dx, j+dy] if (i+ dx).between?(0,7) && (j+ dy).between?(0,7)
        end
        all_moves
    end


    private
    def move_diffs
        
    end
end
