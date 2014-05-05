class Transaction < ActiveRecord::Base
  belongs_to :account
  belongs_to :transaction_type
  belongs_to :spend_category
end
