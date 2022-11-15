class FollowsController < ApplicationController
  before_action :set_user

  def followers
    render json: @user.followers.to_json
  end

  def followed
    render json: @user.followed.to_json
  end

  def unfollow
    Follow.where(follower_id: current_user.id, followed_id: params["followed_id"]).take
  end

  def create
    follow = Follow.new(follower_id: @user.id, followed_id: )
    if follow.save
      render status: 200
    else
      render json: { error: "There was an error while trying to follow a user.", status: 500 }, status: 500
    end
  end

  private

  def set_user
    @user = User.find_by(id: params['id']) || current_user
  end
end
