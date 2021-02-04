import React from  'react';

class Signup extends Rreact.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      email:    '',
      password: ''
    };
    this.handleSumbit = this.handleSubmit.bind(this);
  }

  handleInput(type) {
    return (e) => {
      this.setState({ [type]: e.target.value });
    }
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.createNewUser(this.state)
      .then( () => this.props.history.push('/chirps'));
  }

  render () {
    return (
      <div className="session-form">
      <h2>Sign up!</h2>
        <form>
          <label>Username:
            <input type="text"
                   value={this.state.username}
                   onChanged={this.handleInput('username')} />
          </label>
          <label>Email:
            <input type="text"
                   value={this.state.email}
                   onChanged={this.handleInput('email')} />
          </label>
          <label>Password:
            <input type="password"
                   value={this.state.password}
                   onChanged={this.handleInput('password')} />
          </label>
          <button onClick={this.handleSubmit}>Sign Up</button>
        </form>
      </div>
    );
  }
}

export default Signup;
