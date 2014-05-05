class CreateSpendCategories < ActiveRecord::Migration
  def change
    create_table :spend_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
