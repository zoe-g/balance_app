class DefaultSpendCategory < ActiveRecord::Migration
  def change
  	change_column_default(:transactions, :spend_category_id, 1)
  end
end
