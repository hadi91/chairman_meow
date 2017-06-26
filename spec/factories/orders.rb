FactoryGirl.define do
  factory :order do
    association :user, factory: :user
    orderstatus 1
  end
end
