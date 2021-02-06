import React from 'react';

class Greeting extends React.Component {
  render() {
    let user = this.props.user;
    return (
      <p>{user || user === {} ? user.username : "whelp"}</p>
    )
  }
}

export default Greeting;