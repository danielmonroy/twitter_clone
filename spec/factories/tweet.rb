FactoryBot.define do
  factory :tweet, class: "Tweet" do
    sequence(:body) { |n| "Tweet content #{n}" }
    retweet { false }
    original_tweet_id { nil }
    association :user
  end
end
