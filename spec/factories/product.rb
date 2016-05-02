require 'ffaker'

FactoryGirl.define do
  factory :product do
    name { FFaker::Lorem.word }
    price { rand(3000..5000) }
    description { FFaker::Lorem.paragraph }
    seller_id { rand(10) }
  end
end
