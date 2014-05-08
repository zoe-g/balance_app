class Account < ActiveRecord::Base

	validates :user_id, presence: true
	validates :account_type_id, presence: true

  belongs_to :user
  belongs_to :account_type
  has_many :transactions

	private
		def new_txn_to_acct(amount,cleared)
		 self.current_balance += amount
		 if cleared == true
		  self.bank_balance += amount
		 end
		end

end
