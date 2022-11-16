import React, { useState, useEffect } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import actions from '../actions'

const SingleTweetContainer = (props) => {
  const dispatch = useDispatch();
  
  const tweet = props.tweet;
  const retweet = !!tweet.retweet;
  const user = tweet.user;
  const author = tweet.retweet ? tweet.original_author : user;
  const content = tweet.retweet ? tweet.original_tweet : tweet;

  const author_name = `${author.first_name} ${author.last_name}`;
  const user_name = `${user.first_name} ${user.last_name}`;

  const like = (id) => {
    dispatch(actions.like(id));
  }

  const unlike = (id) => {
    dispatch(actions.unlike(id));
  }

  const retweetTweet = (id) => {
    dispatch(actions.retweet(id));
  }

  const deleteTweet = (id) => {
    dispatch(actions.deleteTweet(id));
  }

  return (
    <div className="tweetBox">
      { retweet && (
        <p className="retweetBanner">{ user_name } retweeted</p>
      ) }
      <h4>{ author_name } <span className="muted">@{ author.username }</span></h4>
      <p>{ content.body }</p>
      <button>Like ({ tweet.likes_count })</button>
      <hr />
    </div>
  )
}

export default SingleTweetContainer;