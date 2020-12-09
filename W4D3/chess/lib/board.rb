require_relative 'pieces/nullpiece'
require_relative 'pieces/piece'

class Board
  def initialize
    @rows = Array.new(8) do |idx|
      if  idx <= 1 || idx >= 6
        Array.new(8) { Piece.new() }
      else 
        Array.new (8) { NullPiece.new() }
      end

    end 
  end

  def move_piece(start_pos, end_pos)
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
