FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "testuser#{n}" }
    sequence(:email) { |n| "email#{n}@example.com" }
    firstname "Bob"
    lastname "Martin"
    telephone_number "81282382"
    password '123123123'
    address "Blk 123 Tanjong Pagar Rd #12-123 Singapore 123456"

    trait :invalid do
      username nil
    end
  end
end
