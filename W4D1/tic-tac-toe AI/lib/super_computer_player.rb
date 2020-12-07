require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    ttt_n = TicTacToeNode.new(game.board, mark)
    ttt_n_children = ttt_n.children
    ttt_n_children.each { |move| return move.prev_move_pos if move.winning_node?(mark) }
    ttt_n_children.each { |move| return move.prev_move_pos if !move.losing_node?(mark) }
    raise "CHEATER!" 
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
