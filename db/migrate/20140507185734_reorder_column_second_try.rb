class ReorderColumnSecondTry < ActiveRecord::Migration
  def change
  	remove_column(:accounts, :actual_balance)
  	add_column(:accounts, :current_balance, :decimal, {precision: 8, scale: 2, default: 0.0, :after => :bank_balance})
  end
end
