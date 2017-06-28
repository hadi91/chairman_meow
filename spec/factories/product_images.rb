FactoryGirl.define do
  factory :product_image do
    image "image1"
    association :product, factory: :product
  end
end
