import React from 'react';

export default class Tile extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            key: props.key
        }
        console.log(props)
    }

    className() {
        return("minesweeper-tile")
    }

    render() {
        return(
            <div className={this.className()} 
                 key={this.state.key}>
                     <p>T</p>
            </div>
        )
    }
}