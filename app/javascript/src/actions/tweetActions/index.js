import ApiClient from "../../ApiClient";
import {
  SET_TWEETS,
  NEW_TWEET,
  DELETE_TWEET,
  RETWEET
} from '../actionsConstants';

function setTweets(tweets) {
  return {
    type: SET_TWEETS,
    payload: tweets
  };
}

function newTweet(tweet) {
  return {
    type: NEW_TWEET,
    payload: tweet
  };
}

function newRetweet(tweet) {
  return {
    type: RETWEET,
    payload: tweet
  };
}

function removeTweet(tweet_id) {
  return {
    type: DELETE_TWEET,
    payload: tweet_id
  }
}


function getTweets() {
  return (dispatch) => {
    return ApiClient.getTweetsFeed()
    .then((response) => dispatch(setTweets(response.data)))
    .catch((error) => console.log(error));
  }
}

function createTweet(body, token) {
  return (dispatch) => {
    return ApiClient.newTweet(body, token)
    .then((response) => dispatch(newTweet(response.data)))
    .catch((error) => console.log(error));
  }
}

function retweet(tweet_id) {
  return (dispatch) => {
    return ApiClient.retweet(tweet_id)
    .then((response) => dispatch(newRetweet(response.data)))
    .catch((error) => console.log(error));
  }
}

function deleteTweet(id) {
  return (dispatch) => {
    return ApiClient.deleteTweet(id)
    .then((response) => dispatch(removeTweet(response.data)))
    .catch((error) => console.log(error));
  }
}

export default {
  getTweets,
  createTweet,
  retweet,
  deleteTweet,
  setTweets,
  createTweet,
  newTweet,
  removeTweet
}