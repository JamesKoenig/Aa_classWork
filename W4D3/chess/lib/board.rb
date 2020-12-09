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
    start_x, star_y = start_pos
    end_x,   end_y  = end_pos

    # if there's no piece at the starting position
    if self[start_pos].empty? # is_a?(NullPiece)
      raise "no piece at this position"
    end

    # if the piece cannot move to the location
    if false # TODO: placeholder
      # case one
      raise "can't move to this position"
    end
  end
end

# tests for board object
if __FILE__ == $PROGRAM_NAME

end
