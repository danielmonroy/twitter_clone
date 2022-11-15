class Like < ApplicationRecord
  include ActiveModel::Serializers::JSON
  belongs_to :tweet
  belongs_to :user
end
