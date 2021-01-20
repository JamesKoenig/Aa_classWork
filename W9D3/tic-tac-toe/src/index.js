const View = require('./ttt-view.js');
const Game = require('./game.js');

  $(() => {
    const game    = new Game();
    let container =  $('.ttt');
    const view    = new View(game,container);

    view.setupBoard();
    view.bindEvents();
  });
