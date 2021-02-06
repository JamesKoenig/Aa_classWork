import React       from 'react';
import ReactDOM    from 'react-dom';
import Root        from './components/root';
import createStore from './store/store';
import * as sessionActions from './actions/session';



document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");

  let preloadedState = undefined;
  if(window.currentUser) {
    preloadedState = {
      session: {
        id: window.currentUser.id
      }
    };
  }
  window.sessionActions = sessionActions;

  const store = createStore(preloadedState);

  window.getState = store.getState;
  window.dispatch = store.dispatch;

  ReactDOM.render(<Root store={store} />, root);
});