# == Schema Information
#
# Table name: shopping_carts
#
#  id            :integer
#  buyer_id      :integer
#  total_price   :float
#

class ShoppingCart < ActiveRecord::Base
  has_many :shopping_cart_items
  has_many :products, through: :shopping_cart_items
  belongs_to :user, foreign_key: :buyer_id

  def add_product(product)
    items = self.shopping_cart_items
    item = self.shopping_cart_items.find_by product_id: product.id
    if item
      item.quantity += 1
      item.save
    else
      self.products << product
      self.save
    end
  end
end
