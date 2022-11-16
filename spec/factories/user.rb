FactoryBot.define do
  factory :user, class: "User" do
    sequence(:email) { |n| "test#{n}@test.com" }
    sequence(:username) { |n| "username#{n}" }
    password { "123456" }
    first_name { "John" }
    last_name { "Doe" }
  end
end
