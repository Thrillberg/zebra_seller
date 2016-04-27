class AddPriceToShoppingCartItem < ActiveRecord::Migration
  def change
    add_column :shopping_cart_items, :price, :float
    add_column :shopping_carts, :total_price, :float
    remove_column :shopping_carts, :seller_id
  end
end
