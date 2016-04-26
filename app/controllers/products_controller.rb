class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    item = ShoppingCartItem.new(shopping_cart_id: ShoppingCart.where(buyer_id: current_user.id)[0].id, product_id: Product.find(params[:product_id]).id)
    item.save
    flash[:notice] = "#{Product.find(params[:product_id]).name} has been added to your cart"
    redirect_to :back
  end
end
