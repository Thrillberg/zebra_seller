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
    item = self.shopping_cart_items.where(product_id: product.id)[0]
    if items.map {|i| i.product_id}.include? product.id
      item.quantity += 1
      item.save
      item.reload
    else
      self.products << product
      self.save
      items.last.quantity = 1
      items.last.save
    end
  end
end
