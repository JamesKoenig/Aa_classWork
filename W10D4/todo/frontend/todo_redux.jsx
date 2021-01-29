import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/app';
import configureStore from './store/store';

document.addEventListener("DOMContentLoaded", () => {
  window.store = configureStore(); //only in developing; make sure to remove it later
  const reactRoot = document.getElementById('react-root');
  ReactDOM.render(<App />, reactRoot);
});