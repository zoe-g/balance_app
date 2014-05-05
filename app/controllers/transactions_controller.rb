class TransactionsController < ApplicationController
	include TransactionsHelper

	before_filter :signed_in_user
	before_filter :transactions_owned, only: [:index, :create, :show, :edit, :update, :destroy]

  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def create
    transaction = Transaction.create transaction_params
    redirect_to transaction
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    transaction = Transaction.find(params[:id])
    transaction.update_attributes transaction_params
    redirect_to transaction

  def destroy
    transaction = Transaction.find(params[:id])
    transaction.delete
    redirect_to transactions_path
  end

  private
    def transaction_params
      params.require(:transaction).permit(:account_id, :transaction_type_id, :transaction_date, :to_or_from, :amount, :spend_category_id, :note, :cleared)
    end

end
