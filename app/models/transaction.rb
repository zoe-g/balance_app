class Transaction < ActiveRecord::Base
	
	# ensures all outgoing transactions are negative, all incoming transactions are positive
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
  
  default_scope { order('transaction_date DESC') }

end
