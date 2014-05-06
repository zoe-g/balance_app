class TransactionsController < ApplicationController
	include TransactionsHelper

	before_filter :signed_in_user
	before_filter :transactions_owned, only: [:index, :create, :edit, :update, :destroy]

  #VIEW ALL TRANSACTIONS
  def index
    @user_transactions = @current_user.transactions
  end

  #ADD TRANSACTION
  def new
    @transaction = Transaction.new
    @user_accounts = @current_user.accounts
  end

  def create
    @transaction = Transaction.create(transaction_params)
    redirect_to transactions_path
  end

  def edit
    @transaction = @current_user.transactions.find(params[:id])
    @user_accounts = @current_user.accounts
  end

  def update
    @transaction = @current_user.transactions.find(params[:id])
    @transaction.update_attributes transaction_params
    redirect_to transactions_path
  end

  def destroy
    transaction = @current_user.transactions.find(params[:id])
    transaction.delete
    redirect_to transactions_path
  end

  private
    def transaction_params
      params.require(:transaction).permit(:account_id, :transaction_type_id, :transaction_date, :to_or_from, :amount, :spend_category_id, :note, :cleared)
    end

end
