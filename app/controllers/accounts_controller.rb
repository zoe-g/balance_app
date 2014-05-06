class AccountsController < ApplicationController
	include AccountsHelper

	before_filter :signed_in_user
	before_filter :accounts_owned, only: [:index, :update, :show]

  # ACCOUNT SUMMARY
  def index
    @user_accounts = @current_user.accounts
  end

  def edit
    @account = @current_user.accounts.find(params[:id])
  end

  def update
    @account = @current_user.accounts.find(params[:id])
    @account.update_attributes(account_params)
    redirect_to accounts_path
  end

  # ACCOUNT LEDGER
  def show
    @account = @current_user.accounts.find(params[:id])
    @transactions = @account.transactions
  end

  private
    def account_params
      params.require(:account).permit(:active, :starting_balance)
    end

end
