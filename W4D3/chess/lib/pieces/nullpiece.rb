require_relative 'piece'
require          'singleton'

class NullPiece < Piece
  include Singleton

  def empty? 
    true
  end
end