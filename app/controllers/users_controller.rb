class UsersController < ApplicationController

	def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "you're in! ready to get balanced?"
      sign_in @user
      redirect_to @user
    else
      flash[:error] = "something went wrong. try again."
      redirect_to new_user_path
    end
    #CREATE FOUR ACCOUNTS ASSOCIATED WITH THE USER IMMEDIATELY, SET CASH TO ACTIVE AND OTHERS TO INACTIVE
    #LEAD THROUGH ACCOUNT SET UP PROCESS???
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to @user
    #ADD EDIT PAGE? PARTIAL? PUT ALL USER/ACCOUNT EDITING INTO ONE PAGE?
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :email_address, :password, :password_confirmation)
    end
    
end
