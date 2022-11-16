import update from 'immutability-helper';

import {
  SET_TWEETS,
  NEW_TWEET,
  DELETE_TWEET,
  RETWEET
} from '../../actions/actionsConstants';

const initialState = {
  list: []
};

export { initialState };

export default (state = initialState, action) => {
  switch (action.type) {
    case SET_TWEETS:
      return { ...state, list: action.payload };
    case NEW_TWEET:
      return update(state, {
        list: { $push: [action.payload] }
      });
    case RETWEET:
      return update(state, {
        list: { $push: [action.payload] }
      })
    case DELETE_TWEET:
      const idx = state.list.findIndex((tweet) => tweet.id == action.payload);
      return update(state, {
        list: { $splice: [[idx, 1]] }
      });
    default:
      return state;
  }
}
