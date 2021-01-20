class View {
  constructor(game, $el) {
    this.game  = game;
    this.board = $el;
  }

  bindEvents() {
    $(".board li").click((e) => {
      // debugger
      let posStrings = $(e.currentTarget).data("pos").split(",");
      alert(posStrings);
      this.game.playMove(posStrings); //e.currentTarget())
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
