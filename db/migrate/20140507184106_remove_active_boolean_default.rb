class RemoveActiveBooleanDefault < ActiveRecord::Migration
  def change
  	change_column_default(:accounts, :actual_balance, nil)
  end
end
