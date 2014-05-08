class AccountsController < ApplicationController
	include AccountsHelper

	before_filter :signed_in_user
	before_filter :accounts_owned, only: [:index, :update, :show]

  # ACCOUNTS
  def index
    @user = @current_user
    @user_accounts = @current_user.accounts
    @total_balance = @current_user.total_balance
    @cleared_balance = @current_user.cleared_balance
  end

  # EDIT ACCOUNT
  def edit
    @account = @current_user.accounts.find(params[:id])
  end

  def update
    @account = @current_user.accounts.find(params[:id])
    @account.update_attributes(account_params)
    redirect_to accounts_path
  end

  # ACCOUNT
  def show
    @account = @current_user.accounts.find(params[:id])
    @transactions = @account.transactions
  end

  private
    def account_params
      params.require(:account).permit(:active, :starting_balance)
    end

end
