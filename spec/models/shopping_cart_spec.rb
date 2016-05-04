require 'rails_helper'

describe ShoppingCart do
  context "add product" do
    it "increments the quantity count on the shopping cart item selected by the current user" do
      cart = FactoryGirl.create :shopping_cart
      product = FactoryGirl.create :product
      cart.add_product(product)
      expect(cart.shopping_cart_items.first.quantity).to eq(1)
      cart.add_product(product)
      cart.reload
      expect(cart.shopping_cart_items.first.quantity).to eq(2)
    end
  end

  context "remove product" do
    it "decrements the quantity count on the shopping cart item selected by the current user" do
      cart = FactoryGirl.create :shopping_cart
      product = FactoryGirl.create :product
      cart.add_product(product)
      cart.remove_product(product)
      cart.reload
      expect(cart.shopping_cart_items.first.quantity).to eq(0)
    end
  end
end
