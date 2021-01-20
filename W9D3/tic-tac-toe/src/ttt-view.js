class View {
  constructor(game, $el) {
    this.game  = game;
    this.board = $el;
  }

  bindEvents() {}

  makeMove($square) {}

  setupBoard() {
    let $ul = $('<ul></ul>');
    for(let i = 0; i < 9; i++) {
      let $li = $('<li></li>');
      $ul.append($li);
    }
    $ul.addClass('board');
    this.board.append($ul);

  }
}

module.exports = View;
