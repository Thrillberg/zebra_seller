class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find params[:id]
  end

  def add_to_cart
    @cart = ShoppingCart.find_by buyer_id: current_user.id
    product = Product.find params[:product_id]
    if @cart == nil
      @cart = ShoppingCart.new buyer_id: current_user.id
      @cart.add_product(product)
    else
      @cart.add_product(product)
    end
    flash[:notice] = "#{Product.find(params[:product_id]).name} has been added to your cart"
    redirect_to root_path
  end

  def remove_from_cart
    @cart = ShoppingCart.find_by buyer_id: current_user.id
    product = Product.find params[:product_id]
    @cart.remove_product(product)
    flash[:notice] = "#{Product.find(params[:product_id]).name} has been removed from your cart"
    redirect_to root_path
  end
end
