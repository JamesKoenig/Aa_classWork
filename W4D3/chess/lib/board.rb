require_relative 'pieces/nullpiece'
require_relative 'pieces/piece'
require_relative 'errors'

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
    # if there's no piece at the starting position
    if self[start_pos].empty? # is_a?(NullPiece)
      raise Errors::NoPieceError, "no piece at this position"
    end

    # if the piece cannot move to the location
    if false # TODO: placeholder
      # case one
      raise "can't move to this position"
    end

    # if everything is successful, move the piece from start to end pos
  end
  private
  attr_reader :null_piece
end

# tests for board object
if __FILE__ == $PROGRAM_NAME
  test = Board.new
  test.move_piece([0,0], [0,5])
  begin
    test.move_piece([5,4], [4,4])
  rescue Errors::NoPieceError => error
    puts "no piece test successful!, got:"
    p error
  end
  puts "yay"
end
