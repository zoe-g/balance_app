class DecimalToFloat < ActiveRecord::Migration
  def change
  	change_column(:accounts, :bank_balance, :float, default: 0)
  	change_column(:accounts, :current_balance, :float, default: 0)
  	change_column(:transactions, :amount, :float)
  end
end
