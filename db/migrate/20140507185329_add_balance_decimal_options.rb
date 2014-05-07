class AddBalanceDecimalOptions < ActiveRecord::Migration
  def change
  	change_column(:accounts, :current_balance, :decimal, {precision: 8, scale: 2, default: 0.0})
  end
end
