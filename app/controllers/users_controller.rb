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
    binding.pry
    if @user.stripe_account_status
      reactivate_seller_account
    else
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
  end

  def reactivate_seller_account
    binding.pry
    @user = User.find(params[:user_id])
    @user.seller = true
    @user.save
    flash[:notice] = "You have reactivated your account."
  end

  def toggle_zebra_seller
    @user = User.find(params[:user_id])
    if @user.seller == false
      @user.seller = true
      @user.save
      unless @user.stripe_account_status
        create_stripe_account
      end
    else
      Product.where(seller: @user).each do |product|
        product.destroy
      end
      @user.seller = false
      @user.save
    end
  end

  def create_stripe_account
    connector = StripeManaged.new( current_user )
    account = connector.create_account!(
      params[:user][:tos_date] == '1', request.remote_ip
    )
  end

  private

  def clean_params
    params.require(:user).permit(:email, :password, :password_confirmation, :seller, :ssn, :first_name, :last_name, :street_address, :city, :state, :date_of_birth)
  end
end
