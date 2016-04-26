# == Schema Information
#
# Table name: shopping_carts
#
#  id            :integer
#  buyer_id      :integer
#  seller_id     :integer
#

class ShoppingCart < ActiveRecord::Base
  has_many :shopping_cart_items
  has_many :products, through: :shopping_cart_items
  belongs_to :user
end
