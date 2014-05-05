class SetBooleanDefaults < ActiveRecord::Migration
  def change
  	change_column_default(:accounts, :active, false)
  	change_column_default(:transactions, :cleared, false)
  end
end
