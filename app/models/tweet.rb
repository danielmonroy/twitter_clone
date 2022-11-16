class Tweet < ApplicationRecord
  include ActiveModel::Serializers::JSON

  belongs_to :user
  has_many :likes, dependent: :destroy

  before_destroy :delete_retweets

  scope :from_followed, -> (user) { where(user_id: user.followed.pluck(:id) << user.id )}
  scope :from_user, -> (user) { where(user_id: user.id)}

  def likes_count
    self.likes.count
  end

  def original_tweet
    self.retweet ? Tweet.find(self.original_tweet_id) : nil
  end

  def original_author
    self.retweet ? Tweet.find(self.original_tweet_id).user : nil
  end

  private

  def delete_retweets
    Tweet.where(original_tweet_id: self.id).destroy_all
  end
end
