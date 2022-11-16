FactoryBot.define do
  factory :follow, class: "Follow" do
    association :followed, factory: :user
    association :follower, factory: :user
  end
end
