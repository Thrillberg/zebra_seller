class ShoppingCartsController < ApplicationController
  def show
    @shopping_cart = ShoppingCart.where(buyer_id: current_user.id)[0]
  end

  def clear_cart
    @cart = ShoppingCart.find_by buyer_id: current_user.id
    @cart.shopping_cart_items.clear
    render json: @cart
  end
end
