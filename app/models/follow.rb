class Follow < ApplicationRecord
  include ActiveModel::Serializers::JSON
  
  belongs_to :follower, :class_name => 'User'
  belongs_to :followed, :class_name => 'User'

  scope :user_followed, -> (user_id) { where(follower_id: user_id) }
  scope :user_followers, -> (user_id) { where(followed_id: user_id) }

end
