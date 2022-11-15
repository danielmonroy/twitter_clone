class LikesController < ApplicationController
  before_action :set_tweet

  def like
    Like.create(tweet_id: @tweet.id, user_id: current_user.id)
  end

  def unlike
    like = Like.where(tweet_id: @tweet.id, user_id: current_user.id).take
    if like && like.destroy
      render status: 200
    else
      render status: 500
    end
  end

  private

  def like_params
    params.permit(:tweet_id)
  end

  def set_tweet
    @tweet = Tweet.find_by(id: like_params[:tweet_id])
  end
end
