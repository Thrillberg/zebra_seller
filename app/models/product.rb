# == Schema Information
#
# Table name: products
#
#  id            :integer
#  name          :string
#  price         :float
#  description   :text
#

class Product < ActiveRecord::Base
  has_many :shopping_cart_items
  has_many :shopping_carts, through: :shopping_cart_items
end
