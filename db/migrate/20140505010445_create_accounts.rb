class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :user, index: true
      t.references :account_type, index: true
      t.boolean :active
      t.decimal :starting_balance, :precision => 8, :scale => 2
      t.datetime :last_txn_added
      t.datetime :last_txn_cleared

      t.timestamps
    end
  end
end
