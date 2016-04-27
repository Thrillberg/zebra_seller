class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    if buyers_shopping_cart == nil
      cart = ShoppingCart.new(buyer_id: current_user.id)
      cart.products << Product.find(params[:product_id])
      cart.shopping_cart_items.last.quantity = 1
      cart.save
    elsif buyers_shopping_cart.products.include? Product.find(params[:product_id])
      product_in_cart = buyers_shopping_cart.shopping_cart_items.where(product_id: params[:product_id])[0]
      product_in_cart.quantity += 1
      product_in_cart.save
    else
      item = ShoppingCartItem.new(shopping_cart_id: buyers_shopping_cart.id, product_id: Product.find(params[:product_id]).id)
      buyers_shopping_cart.products << Product.find(params[:product_id])
      buyers_shopping_cart.shopping_cart_items.last.quantity = 1
      buyers_shopping_cart.shopping_cart_items.last.save
    end
    flash[:notice] = "#{Product.find(params[:product_id]).name} has been added to your cart"
    redirect_to :back
  end
end
