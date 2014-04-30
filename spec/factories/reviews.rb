# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    rating 1
    description "MyString"
    business_id "MyString"
    integer "MyString"
    user_id 1
  end
end
