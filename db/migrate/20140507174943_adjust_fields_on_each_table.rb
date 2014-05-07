class AdjustFieldsOnEachTable < ActiveRecord::Migration
  def change
  	rename_column(:accounts, :active, :actual_balance)
  	rename_column(:accounts, :starting_balance, :bank_balance)
  	add_column(:users, :phone, :string)
  	add_column(:account_types, :icon, :string)
  	add_column(:transaction_types, :icon, :string)
  	add_column(:spend_categories, :icon, :string)
  end
end
