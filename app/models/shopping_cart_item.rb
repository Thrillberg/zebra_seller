# == Schema Information
#
# Table name: shopping_cart_items
#
#  id                    :integer
#  shopping_cart_id      :integer
#  product_id            :integer
#  quantity              :integer
#  price                 :float
#

class ShoppingCartItem < ActiveRecord::Base
  belongs_to :shopping_cart
  belongs_to :product
  before_validation(on: :create) do
    self.quantity = 1
  end
end
