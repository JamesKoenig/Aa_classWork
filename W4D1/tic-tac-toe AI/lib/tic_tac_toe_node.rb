require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board           = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos   = prev_move_pos
  end

  def losing_node?(evaluator)
    lose_prc = Proc.new { |child| child.losing_node?(evaluator) }
    if @board.over?
      return @board.winner == TicTacToeNode.other_mover(evaluator)
    elsif evaluator == @next_mover_mark
      children.all?(&lose_prc)
    else
      children.any?(&lose_prc)
    end 
  end

  def self.other_mover(evaluator)
    case evaluator
    when :x
      :o
    when :o
      :x
    end
  end

  def winning_node?(evaluator)
    win_prc = ->(child) { child.winning_node?(evaluator) }
    if board.over?
      return @board.winner == evaluator
    elsif evaluator == @next_mover_mark
      children.any?(&win_prc)
    else
      children.all?(&win_prc)
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    childs = []
    @board.rows.each_with_index do |row,row_idx|
      row.each_with_index do |ele,col_idx|
        if ele == nil
          new_board = @board.dup
          new_board[[row_idx,col_idx]] = @next_mover_mark # :x
          childs << TicTacToeNode.new(new_board,other_mover_mark,[row_idx,col_idx]) # :o
        end
      end
    end
    return childs
  end

  def other_mover_mark
    @next_mover_mark == :x ? :o : :x
  end
end
