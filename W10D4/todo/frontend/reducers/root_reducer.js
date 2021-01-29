// import todos_reducer from "./todos_reducer";
import { combineReducers } from 'redux';
import todosReducer from "./todos_reducer";

const rootReducer = combineReducers({todo: todosReducer});

export default rootReducer;