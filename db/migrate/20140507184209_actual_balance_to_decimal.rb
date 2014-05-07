class ActualBalanceToDecimal < ActiveRecord::Migration
  def change
  	remove_column(:accounts, :actual_balance)
  	add_column(:accounts, :current_balance, :decimal, after: :account_type_id)
  end
end
