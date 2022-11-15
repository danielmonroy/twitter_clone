class Tweet < ApplicationRecord
  include ActiveModel::Serializers::JSON

  belongs_to :user
  has_many :likes, dependent: :destroy

  scope :from_followed, -> (user) { where(id: user.followed.pluck(:id) << user.id )}
  scope :from_user, -> (user) { where(user_id: user.id)}
end
