# == Schema Information
#
# Table name: products
#
#  id            :integer
#  name          :string
#  price         :float
#  description   :text
#  seller_id     :integer
#

class Product < ActiveRecord::Base
  has_many :shopping_cart_items
  has_many :shopping_carts, through: :shopping_cart_items
  belongs_to :seller, class_name: "User", foreign_key: :seller_id
end
