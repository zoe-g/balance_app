class Transaction < ActiveRecord::Base
	
	# all outgoing transactions are negative (Cr), all incoming transactions are positive (Dr)
	before_save do |transaction|
		if transaction_type_id == 1
			transaction.amount = (amount).abs * -1
		elsif transaction_type_id == 2
			transaction.amount = (amount).abs
		end
	end

	validates :account_id, presence: true
	validates :transaction_type_id, presence: true
	validates :transaction_date, presence: true
	validates :amount, presence: true

  belongs_to :account
  belongs_to :transaction_type
  belongs_to :spend_category
  
end
