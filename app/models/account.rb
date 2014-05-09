class Account < ActiveRecord::Base

	validates :user_id, presence: true
	validates :account_type_id, presence: true

  belongs_to :user
  belongs_to :account_type
  has_many :transactions
  has_many :account_types

  # sums up all transactions in an individual account
  def actual_balance
  	total = []
  	self.transactions.each do |txn|
      bal = txn.amount
  		total.push(bal)
  	end
  	return total.sum #float
  end

  # sums up the transactions that have been marked 'cleared' in an individual account
  def bank_balance
  	total = []
  	self.transactions.each do |txn|
  		if txn.cleared == true
        bal = txn.amount
  			total.push(bal)
  		end
  	end
  	return total.sum #float
  end

  # identifies the timestamp of the last update made to the transactions within an individual account
  def last_txn_update
    if self.transactions.first.nil?
      return ''
    else
      last_update = self.transactions.order(:updated_at).last.updated_at
      return last_update.to_date.to_formatted_s(:long)
    end
  end

end
