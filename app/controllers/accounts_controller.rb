class AccountsController < ApplicationController
	include AccountsHelper

	before_filter :signed_in_user
	before_filter :accounts_owned, only: [:index, :create, :show, :edit, :update, :destroy]

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    account = Account.create account_params
    redirect_to account
  end

  def show
    @account = Account.find(params[:id])
    @transactions = @account.transactions
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    account = Account.find(params[:id])
    account.update_attributes account_params
    redirect_to account
  end

  def destroy
    account = Account.find(params[:id])
    account.delete
    redirect_to accounts_path
  end

  private
    def account_params
      params.require(:account).permit(:account_type_id, :starting_balance)
    end

end
