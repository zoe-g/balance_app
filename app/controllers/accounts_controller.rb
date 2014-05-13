class AccountsController < ApplicationController

	before_filter :signed_in_user
	before_filter :accounts_owned, only: [:index,:show]

  # ACCOUNTS
  def index
    @user = @current_user
    @user_accounts = @current_user.accounts
    @total_balance = @current_user.total_balance
    @cleared_balance = @current_user.cleared_balance
    @last_txn_overall = @current_user.last_txn_update
  end

  # ACCOUNT
  def show
    @account = @current_user.accounts.find(params[:id])
    @transactions = @account.transactions
  end

end
