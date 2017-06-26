FactoryGirl.define do
  factory :product_image do
    imageurl "imageurl1"
    association :product, factory: :product
  end
end
