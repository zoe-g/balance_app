class UsersController < ApplicationController

  #SIGN UP
  def new
    @user = User.new
  end

  # USERS
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "you're in! ready to get balanced?"
      redirect_to home_path
    else
      flash[:error] = "something's off balance. please try again."
      redirect_to signup_path
    end
    #CREATE FOUR ACCOUNTS ASSOCIATED WITH THE USER IMMEDIATELY, SET CASH TO ACTIVE AND OTHERS TO INACTIVE
    #LEAD THROUGH ACCOUNT SET UP PROCESS???
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :email_address, :password, :password_confirmation)
    end
    
end
