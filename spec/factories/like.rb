FactoryBot.define do
  factory :like, class: "Like" do
    association :user
    association :tweet
  end
end
