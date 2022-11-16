import axios from 'axios';

function getTweetsFeed() {
  return axios.get('/api/v1/tweets');
}

function getTweetsFromUser(username) {
  return axios.get(`/api/v1/${username}`);
}

function retweet(tweet_id) {
  return axios.post('/api/v1/tweets', { id: tweet_id });
}

function newTweet(body, token) {
  return axios.post('/api/v1/tweets', { body: body }, { headers: {
    "X-CSRF-Token": token,
    "Content-Type": "application/json"
  }});
}

function deleteTweet(id) {
  return axios.delete('/api/v1/tweets', { id: id });
}

function like(tweet_id) {
  return axios.post('/api/v1/likes/like', { tweet_id: tweet_id });
}

function unlike(tweet_id) {
  return axios.delete('/api/v1/likes/unlike', { tweet_id: tweet_id });
}

function getFollowers(user_id) {
  return axios.get('/api/v1/follows/followers', { id: user_id });
}

function getFollowed(user_id) {
  return axios.get('/api/v1/follows/followed', { id: user_id });
}

function unfollow(user_id) {
  return axios.delete('/api/v1/follows', { id: user_id });
}

function follow(user_id) {
  return axios.post('/api/v1/follows', { id: user_id });
}

export default {
  getTweetsFeed,
  getTweetsFromUser,
  retweet,
  newTweet,
  deleteTweet,
  like,
  unlike,
  getFollowers,
  getFollowed,
  unfollow,
  follow,
};