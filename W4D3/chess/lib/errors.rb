module Errors
  class ChessError   < StandardError; end
  class MoveError    < ChessError;    end
  class NoPieceError < MoveError;     end
end
