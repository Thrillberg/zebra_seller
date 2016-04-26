class ShoppingCartsController < ApplicationController
  def show
    @shopping_cart = ShoppingCart.where(buyer_id: current_user.id)[0]
  end
end
