# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    password_digest "MyString"
    member_since "2014-03-29 05:03:47"
    expires "2014-03-29 05:03:47"
    street "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    cell_phone "MyString"
  end
end
