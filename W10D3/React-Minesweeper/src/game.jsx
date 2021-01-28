import React from "react";
import * as MineSweeper from '../lib/minesweeper'; 
import Board from './board';

export default class Game extends React.Component{
    constructor(props) {
        super(props);
        // initialize new board
        let board = new MineSweeper.Board(3, 1);
        this.state = { board };
        this.updateGame = this.updateGame.bind(this);
    }

    updateGame() {
        // 
    }

    render() {
        return(
            <Board 
                board={this.state.board} 
                updateCB={this.updateGame}
                />
        );
    }
}