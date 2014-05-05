class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :account, index: true
      t.references :transaction_type, index: true
      t.date :transaction_date
      t.string :to_or_from
      t.decimal :amount, :precision => 8, :scale => 2
      t.references :spend_category, index: true
      t.string :note
      t.boolean :cleared

      t.timestamps
    end
  end
end
