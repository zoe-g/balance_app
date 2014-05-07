class ReorderColumn < ActiveRecord::Migration
  def change
  	remove_column(:accounts, :current_balance)
  	add_column(:accounts, :actual_balance, :decimal, {precision: 8, scale: 2, default: 0.0, after: :account_type})
  end
end
