require 'rails_helper'

RSpec.describe Api::V1::LikesController do
  let!(:user1) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user) }
  let!(:tweet1) { FactoryBot.create(:tweet, user: user1) }
  let!(:like1) { FactoryBot.create(:like, user: user1, tweet: tweet1) }

  describe '#like' do
    it 'likes a tweet' do
      sign_in(user2)

      likes_count = tweet1.likes_count
  
      post :like, params: { tweet_id: tweet1.id }
  
      expect(response.status).to eq 204
      tweet1.reload
      expect(tweet1.likes_count).to eq likes_count + 1
    end
  end

  describe '#unlike' do
    it 'unlikes a tweet' do
      sign_in(user1)

      likes_count = tweet1.likes_count
  
      delete :unlike, params: { tweet_id: tweet1.id }
  
      expect(response.status).to eq 200
      tweet1.reload
      expect(tweet1.likes_count).to eq likes_count - 1
    end
  end
end
