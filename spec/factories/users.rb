FactoryGirl.define do
  factory :user do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }
    password "123456"
    password_confirmation { password }
    confirmed_at { 1.hour.ago }
  end
end
