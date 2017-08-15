FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "123456"
    password_confirmation { password }
    confirmed_at { 1.hour.ago }
  end
end
