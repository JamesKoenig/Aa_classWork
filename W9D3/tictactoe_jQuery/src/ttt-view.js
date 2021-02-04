class View {
  constructor(game, $el) {
    this.game = game;
    this.container = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.container.on('click', 'li', (e => {
      this.makeMove($(e.currentTarget));
    }))
  }

  makeMove($square) {
    const pos = $square.data("pos") //getter
    const currentPlayer = this.game.currentPlayer
    //have to use playMove
    this.game.playMove(pos)

    $square.addClass("complete")
    if (this.game.isOver()) {
      alert("game is over")
    }
  }

  setupBoard() {
    const $ul = $("<ul>");
    for (let row = 0; row < 3; row++) {
      for (let col = 0; col < 3; col++) {
        let $li = $("<li>")
        $li.data("pos", [row, col]) //setter
        $ul.append($li);
      }
    }
    this.container.append($ul)
  }
}

module.exports = View;