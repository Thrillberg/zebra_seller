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

  def edit
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])
    toggle_zebra_seller
    if !@user.seller && @user.update_attributes(clean_params)
      params[:user][:seller] = false
      @user.update_attributes({"seller" => params[:user][:seller]})
      flash[:notice] = "You are no longer a seller."
      redirect_to root_url
    elsif @user.seller && @user.update_attributes(clean_params)
      flash[:notice] = "You are registered as a zebra seller."
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def toggle_zebra_seller
    @user = User.find(params[:user_id])
    if @user.seller == false
      @user.seller = true
      @user.save
    else
      Product.where(seller: @user).each do |product|
        product.destroy
      end
      @user.seller = false
      @user.save
    end
  end

  private

  def clean_params
    params.require(:user).permit(:email, :password, :password_confirmation, :seller, :ssn, :name, :address, :date_of_birth)
  end
end
