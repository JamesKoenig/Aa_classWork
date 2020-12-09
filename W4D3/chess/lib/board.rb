require_relative 'pieces/nullpiece'
require_relative 'pieces/piece'

class Board
  def initialize
    @null_piece = NullPiece.instance
    @rows = Array.new(8) do |idx|
      if  idx <= 1 || idx >= 6
        Array.new(8) { Piece.new() }
      else 
        Array.new (8) { null_piece }
      end
    end 
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end  

  def []=(pos,val) 
    row, col = pos
    @rows[row][col] = val
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
  private
  attr_reader :null_piece
end

# tests for board object
if __FILE__ == $PROGRAM_NAME
  test = Board.new
  test.move_piece([0,0], [0,5]) 
  # test.move_piece([5,4], [4,4])
end
