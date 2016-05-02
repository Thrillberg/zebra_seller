require 'ffaker'

FactoryGirl.define do
  factory :shopping_cart do
    buyer_id { rand(100) }
    total_price { rand(3000..5000) }
  end
end
