class TweetsController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_tweet, only: :destroy

  def index
    render json: Tweet.from_followed(current_user).to_json
  end

  def show
    render json: Tweet.from_user(@user).to_json
  end

  def create
    tweet = Tweet.new(tweet_params)
    tweet.user_id = current_user.id
    if tweet.save
      render json: tweet.to_json
    else 
      render json: { error: "There was an error while posting your tweet.", status: 500 }, status: 500
    end
  end

  def destroy
    if @tweet.user.eql? current_user
      @tweet.destroy
      render json: { message: 'Tweet deleted.', status: 200 }
    else
      render json: { error: 'You can not perform this action.', status: 403 }
    end
  end

  private

  def set_user
    @user = User.find_by(username: params['username'])
  end

  def set_tweet
    @tweet = Tweet.find_by(id: params['id'])
  end

  def tweet_params
    params.permit(:body, :retweet, :original_tweet_id)
  end
end
