const View = require('./ttt-view.js')
const Game = require('../../tictactoe_node_solutions/game')

$(() => {
  const newGame = new Game();
  const containerEl = $('.ttt');
  const newView = new View(newGame, containerEl);
});
