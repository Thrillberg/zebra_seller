class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @cart = ShoppingCart.where(buyer_id: current_user.id)[0]
    product = Product.find(params[:product_id])
    if @cart == nil
      @cart = ShoppingCart.new(buyer_id: current_user.id)
      @cart.add_product(product)
    else
      @cart.add_product(product)
    end
    flash[:notice] = "#{Product.find(params[:product_id]).name} has been added to your cart"
    redirect_to :back
  end
end
