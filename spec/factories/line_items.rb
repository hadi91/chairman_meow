FactoryGirl.define do
  factory :line_item do
    association :shopping_cart, factory: :shopping_cart
    association :product, factory: :product
    association :order, factory: :order
    quantity 5

    trait :is_cart_item do
      order nil
    end

    trait :is_order do
      shopping_cart nil
    end

    trait :is_invalid do
      quantity nil
    end
  end
end
