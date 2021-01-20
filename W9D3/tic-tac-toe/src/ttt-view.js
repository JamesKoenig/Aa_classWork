const Board = require('./board.js');
const MoveError = require("./moveError.js")

class View {
  constructor(game, $el) {
    this.game  = game;
    this.board = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $(".board li").click((e) => {
      try {
        this.makeMove($(e.target));
        this.checkVictory();
      } catch (e) {
        if (e instanceof MoveError) {
          alert(e.msg);
        } else {
          throw e;
        }
      }
    })
  }

  makeMove($square) {
    let $h2;
    let currentPlayer = this.game.currentPlayer;
    let posInts       = $square.data("pos").split(",").map(s => parseInt(s));
    this.game.playMove(posInts);

    $h2 = $('<h2></h2>');
    $h2.html(currentPlayer);
    $h2.addClass('playerMark');
    $square.append($h2);
    $square.css('background-color', currentPlayer === "x" ? 'red' : 'blue');
  }

  checkVictory() {
    if(this.game.isOver()) {
      $('.board li').off('click');
      if(this.game.winner()) {
        alert(`${this.game.winner()} wins!`);
      } else {
        alert('This is a tie!😂');
      }
    }
  }

  setupBoard() {
    let $ul = $('<ul></ul>');
    for(let i = 0; i < 3; i++) {
      for(let j = 0; j < 3; j++) {
        let $li = $('<li></li>');
        $li.data("pos", `${i},${j}`);
        $ul.append($li);
      }
    }
    $ul.addClass('board');
    this.board.append($ul);

  }
}

module.exports = View;
