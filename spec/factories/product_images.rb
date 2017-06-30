FactoryGirl.define do
  factory :product_image do
    association :product, factory: :product
    image "image1"

    trait :no_association do
      product nil
    end
  end
end
