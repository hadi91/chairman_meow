FactoryGirl.define do
  factory :product do
    breed "breed1"
    dob Date.today
    description "description1"
    price 450.99
    gender 'Male'
    quantity 1

    trait :invalid do
      breed nil
    end
  end
end
