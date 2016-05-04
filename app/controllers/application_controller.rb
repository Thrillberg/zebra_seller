class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :buyers_shopping_cart

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def buyers_shopping_cart
    cart = ShoppingCart.find_by buyer_id: current_user.id
    if cart
      quantities = cart.shopping_cart_items.map {|i| i.quantity}
      return nil if quantities.count(0) == quantities.length
      return cart
    end
    return nil
  end
end
