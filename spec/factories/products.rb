FactoryGirl.define do
  factory :product do
    breed "MyString"
    dob "2017-06-19"
    description "MyText"
    price "MyString"
    gender 1
    quantity 1
  end
end
