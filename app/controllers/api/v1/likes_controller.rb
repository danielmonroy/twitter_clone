class Api::V1::LikesController < ApplicationController
  before_action :set_tweet

  def like
    Like.create(tweet_id: @tweet.id, user_id: current_user.id)
  end

  def unlike
    like = Like.where(tweet_id: @tweet.id, user_id: current_user.id).take
    if like && like.destroy
      return head :ok
    else
      return head 500
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
