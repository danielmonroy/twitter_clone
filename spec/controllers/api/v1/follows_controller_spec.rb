require 'rails_helper'

RSpec.describe Api::V1::FollowsController do
  let!(:user1) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user) }
  let!(:user3) { FactoryBot.create(:user) }
  let!(:user4) { FactoryBot.create(:user) }
  let!(:follow1) { FactoryBot.create(:follow, followed: user2, follower: user1) }
  let!(:follow2) { FactoryBot.create(:follow, followed: user3, follower: user1) }
  let!(:follow3) { FactoryBot.create(:follow, followed: user4, follower: user1) }

  describe '#followers' do
    it 'returns a list of followers for a specific user' do
      sign_in(user2)
  
      get :followers, params: { id: user2.id }
  
      expect(response.status).to eq 200
      expect(JSON.parse(response.body).size).to eq 1
    end
  end

  describe '#followed' do
    it 'returns a list of followed users for a specific user' do
      sign_in(user1)

      get :followed, params: { id: user1.id }
  
      expect(response.status).to eq 200
      expect(JSON.parse(response.body).size).to eq 3
    end
  end
end
