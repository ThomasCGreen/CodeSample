# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :business do
    name Faker::Company.name
    contact Faker::Name.name
    product Faker::Commerce.product_name
    phone Faker::PhoneNumber
    website Faker::Internet.url
    email Faker::Internet.email
    street Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state_abbr
    zip Faker::Address.zip
  end
end
