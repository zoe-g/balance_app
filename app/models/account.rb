class Account < ActiveRecord::Base

	validates :user_id, presence: true
	validates :account_type_id, presence: true

  belongs_to :user
  belongs_to :account_type
  has_many :transactions
  has_many :account_types


  def actual_balance
  	total = []
  	self.transactions.each do |txn|
      bal = txn.amount
  		total.push(bal)
  	end
  	return total.sum #float
  end

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

  def last_txn_update
    if self.transactions.first.nil?
      return ''
    else
      last_update = self.transactions.order(:updated_at).last.updated_at
      return last_update.to_date.to_formatted_s(:long)
    end
  end

end
