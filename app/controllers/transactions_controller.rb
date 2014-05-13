class TransactionsController < ApplicationController

	before_filter :signed_in_user
	before_filter :transactions_owned, only: [:index, :create, :edit, :update, :destroy]

  # TRANSACTIONS
  def index
    @user_transactions = @current_user.transactions
  end

  # NEW TRANSACTION
  def new
    @transaction = Transaction.new
    @user_accounts = @current_user.accounts
    @spend_categories = SpendCategory.all
  end

  def create
    @transaction = Transaction.create transaction_params

    if @transaction.transaction_type_id == 3
      #if txn is a transfer, create a second record to balance out
      @txn_balance = Transaction.create transaction_params

      #update type to received on second record so it will have a positive amount, and swap to/from accounts
      @txn_balance.update_attributes(account_id: @transaction.to_or_from, to_or_from: AccountType.find(Account.find(@transaction.account_id).account_type_id).name, transaction_type_id: 2)

      #update type to paid on first record so it will have a negative amount
      @transaction.update_attributes(to_or_from: AccountType.find(Account.find(@transaction.to_or_from).account_type_id).name, transaction_type_id: 1)
    end

    redirect_to transactions_path
  end

  # SEARCH TRANSACTIONS
  def search
    @spend_categories = SpendCategory.all
    @user_accounts = @current_user.accounts
    @search = Search.new search_params
    if @search.valid?
      @transactions = @search.search_user_transactions(@current_user.transactions)
    end
  end


  # EDIT TRANSACTION
  def edit
    @transaction = @current_user.transactions.find(params[:id])
    @user_accounts = @current_user.accounts
    @spend_categories = SpendCategory.all
  end

  # TRANSACTION
  def update
    @transaction = @current_user.transactions.find(params[:id])
    @transaction.update_attributes transaction_params
    redirect_to account_path(@transaction.account_id)
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

    def search_params
      if (params.has_key? :search)
        params.require(:search).permit(:account_id, :transaction_type_id, :spend_category_id, :date_beg, :date_end, :to_or_from, :amount_beg, :amount_end, :cleared)
      end
    end

end