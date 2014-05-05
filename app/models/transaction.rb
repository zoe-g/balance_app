class Transaction < ActiveRecord::Base

	validates :account_id, presence: true
	validates :transaction_type_id, presence: true
	validates :transaction_date, presence: true
	validates :amount, presence: true, exclusion: { in: 0 }

  belongs_to :account
  belongs_to :transaction_type
  belongs_to :spend_category
  
end