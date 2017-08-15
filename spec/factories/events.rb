FactoryGirl.define do
  factory :event do
    title { Faker::Lorem.sentence }
    event_type "once"
    date Time.zone.today
    description { Faker::Lorem.paragraph }
    association :user, strategy: :build
  end

  trait :once do
    event_type "once"
  end

  trait :daily do
    event_type "daily"
  end

  trait :weekly do
    event_type "weekly"
  end

  trait :monthly do
    event_type "monthly"
  end

  trait :yearly do
    event_type "yearly"
  end
end
