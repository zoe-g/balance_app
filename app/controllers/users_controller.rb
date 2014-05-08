class UsersController < ApplicationController

  #SIGN UP
  def new
    @user = User.new
  end

  # USERS
  def create
    @user = User.new(user_params)
    if @user.save
      Account.create(user_id: @user.id, account_type_id: 1)
      Account.create(user_id: @user.id, account_type_id: 2)
      Account.create(user_id: @user.id, account_type_id: 3)
      Account.create(user_id: @user.id, account_type_id: 4)
      sign_in @user
      flash[:success] = "you're in! ready to get balanced?"
      redirect_to home_path
    else
      flash[:error] = "something's off balance. please try again."
      redirect_to signup_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :email_address, :phone, :password, :password_confirmation)
    end
    
end
