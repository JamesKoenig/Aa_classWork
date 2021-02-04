
class Piece
    attr_reader :color, :board
    attr_accessor :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s

    end

    def empty?
        @board.rows[pos].nil?
    end

    def valid_moves
        
        
    end

    def pos=(val)
        i, j = pos
        self[i][j] = val

    end

    def symbol
        symbol
    end

    private
    def move_into_check?(end_pos)

    end

end

