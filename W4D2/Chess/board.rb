require 'byebug'
class Board

    # piece is white, null piece is black
    # 0,0 is black
    # 
    attr_reader :rows
    def initialize
        @rows = Array.new(8){Array.new(8, nil)}
        self.load_board
    end

    def [](pos)
        i, j = pos
        @rows[i][j]
    end

    def []=(pos, value)
        @rows[i][j] = value
    end

    def move_piece(start_pos, end_pos)
        #debugger
        i,j = start_pos
        ie, je = end_pos
        raise ArgumentError.new "this position is empty" if @rows[i][j].nil?
        raise ArgumentError.new "this position is already taken" if !@rows[ie][je].nil?
        temp = @rows[i][j]
        @rows[ie][je] = temp
        @rows[i][j] = nil
    end

    def load_board
        #black
        (0..1).each do |r|
            (0..7).each do |c|
                @rows[r][c] = "P.new"
            end
        end

        #white
        (6..7).each do |r|
            (0..7).each do |c|
                @rows[r][c] = "P.new"
            end
        end

        #null piece
        # (2..5).each do |r|
        #     (0..7).each do |c|
        #         @rows[r][c] = nil
        #     end
        # end
    end

    def print
        self.rows.each do |row|
            p row.join(" ")
        end
    end
end

# g = Board.new
# g.print
# g.move_piece([3,0],[0,4])
# g.print



