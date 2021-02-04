require "pieces.rb"
class NullPiece < Piece
    include Singleton
    def initialize
        super(color) ###
    end

    def symbol
        :N
    end
    
    def moves

    end


end