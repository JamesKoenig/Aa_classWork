import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/app';

document.addEventListener("DOMContentLoaded", () => {
  const reactRoot = document.getElementById('react-root');
  ReactDOM.render(<App />, reactRoot);
});