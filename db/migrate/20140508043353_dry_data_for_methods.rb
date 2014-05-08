class DryDataForMethods < ActiveRecord::Migration
  def change
  	remove_column(:accounts, :bank_balance)
  	remove_column(:accounts, :current_balance)
  	remove_column(:accounts, :last_txn_cleared)
  	remove_column(:accounts, :last_txn_added)
  end
end
