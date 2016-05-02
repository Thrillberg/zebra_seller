require 'rails_helper'
require 'database_cleaner'

RSpec.describe ProductsController, type: :controller do
  setup :activate_authlogic

  describe "POST #add_to_cart" do
    before :each do
      user = FactoryGirl.create :user
      log_in(user)
      product = FactoryGirl.create :product
      post :add_to_cart, product_id: product
    end
    context "user has no shopping cart yet" do
      it "creates a new shopping cart" do
        expect(ShoppingCart.count).to eq(1)
      end
    end

    context "user has a shopping cart" do
      it "adds a product to the cart" do
        expect(ShoppingCart.first.shopping_cart_items.first.quantity).to eq(1)
      end
    end
  end
end
