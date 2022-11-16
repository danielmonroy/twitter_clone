import React, { useState, useEffect } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import tweetSelectors from '../reducers/tweets/selectors';
import actions from '../actions'

import SingleTweetContainer from './SingleTweetContainer';

const TweetsContainer = () => {
  const dispatch = useDispatch();

  const tweets = useSelector(tweetSelectors.getTweets);

  const token = document.querySelector('meta[name="csrf-token"]').content;

  const [inputValue, setInputValue] = useState('');

  useEffect(() => {
    dispatch(actions.getTweets());
  }, [dispatch]);

  const handleInputChange = (e) => {
    setInputValue(e.target.value);
  }

  const createTweet = (e) => {
    if (e.key === 'Enter' && e.target.value !== '') {
      dispatch(actions.createTweet(e.target.value, token))
        .then(() => setInputValue(''));
    }
  }

  return (
    <div>
      <div className="header">
        <h1>Tweets Feed</h1>
      </div>
      <div className="inputContainer">
        <input 
          type="text"
          className="tweetInput"
          placeholder="What's on your mind?"
          maxLength="150"
          onKeyPress={createTweet}
          value={inputValue}
          onChange={handleInputChange}
        />
      </div>
      <div className="tweetsFeed">
        {tweets.map((tweet) => (
          <SingleTweetContainer tweet={tweet} key={tweet.id} />
        ))}
      </div>
    </div>
  )
}

export default TweetsContainer;