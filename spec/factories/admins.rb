FactoryGirl.define do
  factory :admin do
    firstname "adminfirst"
    lastname "adminlast"
    username "admin"
    email { |n| "email#{n}@example.com" }
    password "123456"
  end
end
