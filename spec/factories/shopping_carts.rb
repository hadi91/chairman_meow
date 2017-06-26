FactoryGirl.define do
  factory :shopping_cart do
    association :user, factory: :user
  end
end
