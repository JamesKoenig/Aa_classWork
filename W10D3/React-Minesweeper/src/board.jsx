import React from 'react';
import Tile from './tile'

export default class Board extends React.Component {
  constructor(props) {
    super(props);
    this.state = { board:    props.board,
                   updateCB: props.updateCB };
    console.log(this.state)
    }


  render() {
    return (
      <div className="minesweeper-grid">
        {
          this.state.board.grid.map((row) => {
            return( <div className="minesweeper-row"
            key={row.id}>
              {
                row.map(tile => 
                        <Tile key={tile.id}
                              updateCB={this.state.updateCB}/>)
              }
            </div>);
          })
        }
        <p>row your boat</p>
      </div> 
    );
  }
}