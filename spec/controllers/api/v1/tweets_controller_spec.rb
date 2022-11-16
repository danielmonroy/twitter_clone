require 'rails_helper'

RSpec.describe Api::V1::TweetsController do
  let!(:user1) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user) }
  let!(:tweet1) { FactoryBot.create(:tweet, user: user1) }
  let!(:tweet2) { FactoryBot.create(:tweet, user: user1) }
  let!(:tweet3) { FactoryBot.create(:tweet, user: user1) }

  describe '#index' do
    it 'shows tweets from users followed by current user including own tweets' do
      sign_in(user1)
  
      get :index
  
      expect(response.status).to eq 200
      expect(JSON.parse(response.body).size).to eq 3
      expect(JSON.parse(response.body)[0]['id']).to eq tweet3.id
    end
  end

  describe '#show' do
    it 'shows tweets from a specific user' do
      sign_in(user2)

      get :show, params: { username: user1.username }

      expect(response.status).to eq 200
      expect(JSON.parse(response.body).size).to eq 3
    end
  end

  describe '#retweet' do
    it 'creates a retweet based on an existing tweet' do
      sign_in(user2)

      post :retweet, params: { id: tweet1.id }

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)['retweet']).to be_truthy
      expect(JSON.parse(response.body)['original_tweet_id']).to eq tweet1.id
      expect(JSON.parse(response.body)['original_author']['id']).to eq tweet1.user.id
    end
  end

  describe '#create' do
    it 'creates a new tweet' do
      sign_in(user2)

      user_tweets_count = user2.tweets.size

      post :create, params: { body: "test tweet" }

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)['user_id']).to eq user2.id
      user2.reload
      expect(user2.tweets.size).to eq (user_tweets_count + 1)
    end
  end

  describe '#destroy' do
    it 'deletes a tweet' do
      sign_in(user1)

      user_tweets_count = user1.tweets.size

      delete :destroy, params: { id: tweet1.id }

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)['message']).to eq 'Tweet deleted.'
      user1.reload
      expect(user1.tweets.size).to eq (user_tweets_count - 1)
    end
  end
end
