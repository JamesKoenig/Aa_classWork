import React from 'react';

export default class Board extends React.Component {
  constructor(props) {
    super(props);
    this.state = { board:    props.board,
                   updateCB: props.updateCB };
  }

  render() {
    return (
      <p>whoops</p> 
    )
  }
}