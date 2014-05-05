class SetDefaultBalance < ActiveRecord::Migration
  def change
  	change_column_default(:accounts, :starting_balance, 0)
  end
end
