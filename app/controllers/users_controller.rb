class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(clean_params)
    if @user.save
      flash[:notice] = "Registration successful."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def toggle_zebra_seller
    if current_user.seller == false
      current_user.seller = true
      current_user.save
    else
      Product.where(seller: current_user).each do |product|
        product.destroy
      end
      current_user.seller = false
      current_user.save
    end
    redirect_to root_path
  end

  private

  def clean_params
    params.require(:user).permit(:email, :password, :password_confirmation, :seller)
  end
end
