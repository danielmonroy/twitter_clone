import { combineReducers } from 'redux';
import tweetReducer from './tweets/tweetReducer'; 

const rootReducer = combineReducers({
  tweets: tweetReducer,
});

export default rootReducer;