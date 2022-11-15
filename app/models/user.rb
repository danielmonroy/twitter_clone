class User < ApplicationRecord
  include ActiveModel::Serializers::JSON

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet

  def followers
    User.where(id: Follow.user_followers(self.id).pluck(:id))
  end

  def followed
    User.where(id: Follow.user_followed(self.id).pluck(:id))
  end
end
