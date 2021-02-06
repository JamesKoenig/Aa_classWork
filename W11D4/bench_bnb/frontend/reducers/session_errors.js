import { RECEIVE_CURRENT_USER } from '../actions/session';

const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS";

export default (state={}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_SESSION_ERRORS:
      return Object.assign({}) 
    default:
      return state;
  }
}