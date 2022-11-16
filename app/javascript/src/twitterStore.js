import { legacy_createStore as createStore, applyMiddleware, compose } from 'redux';
import thunkMiddleware from 'redux-thunk';
import ReduxPromise from 'redux-promise';

import rootReducers from './reducers';

const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;

const initialState = {};
const store = createStore(
  rootReducers,
  initialState,
  composeEnhancers(applyMiddleware(ReduxPromise, thunkMiddleware))
);

export default store;