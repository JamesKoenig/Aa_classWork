require_relative 'pieces/nullpiece'

class Board
  def initialize
    @board = Array.new(8) { Array.new (8) { NullPiece.new() } }
  end

  def move_piece(start_pos, end_pos)
    start_pos, end_pos = [pos]

    # if there's no piece
    if false # TODO: placeholder
      start_pos = 0
    end

    # if the piece cannot move to the location
    if false # TODO: placeholder
      end_pos = 0
    end
  end
end

# tests for board object
if __FILE__ == $PROGRAM_NAME

end
