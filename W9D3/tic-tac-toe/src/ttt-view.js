const Board = require('./board.js');

class View {
  constructor(game, $el) {
    this.game  = game;
    this.board = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $(".board li").click((e) => {
      // debugger
      let $box       = $(e.currentTarget);
      let posInts = $box.data("pos").split(",").map(s => parseInt(s));
      if(this.game.board.isEmptyPos(posInts)) {
        let $h2 = $('<h2></h2>');
        $h2.html(this.game.currentPlayer);
        $h2.addClass('playerMark');
        $box.append($h2);
 
        if(this.game.currentPlayer === "x") {
          $(e.target).css('background-color','red');
        } else {
          $(e.target).css('background-color','blue');
        }
        this.game.playMove(posInts); //e.currentTarget())
        //debugger;
      } else {
        alert('Invalid position');
      }
    })
  }

  makeMove($square) {}

  setupBoard() {
    let $ul = $('<ul></ul>');
    for(let i = 0; i < 3; i++) {
      for(let j = 0; j < 3; j++) {
        let $li = $('<li></li>');
        $li.data("pos", `${i},${j}`)
        $ul.append($li);
      }
    }
    $ul.addClass('board');
    this.board.append($ul);

  }
}

module.exports = View;
