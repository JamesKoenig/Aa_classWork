import React from 'react';
import ReactDOM from 'react-dom';
import { signup, logout, login } from './util/session_api_util';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");

  ReactDOM.render(
    <p>oh god how did I get here I am not good with computers</p>,
    root);
});

window.login = login;
window.logout = logout;
window.signup = signup;