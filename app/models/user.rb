class User < ActiveRecord::Base
	has_secure_password

	before_save { |user| user.email_address = email_address.downcase }
	before_save { |user| user.phone = phone.gsub(/[^0-9]/, "")}
  before_save :create_remember_token

  validates :first_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :phone, presence: true, length: { in: 10..13}
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

	has_many :accounts
	has_many :transactions, through: :accounts
  
  def helpers
    ActionController::Base.helpers
  end

  ## Awesome code!  I like how you used the account model methods
  ## to write these methods!

  # sums up all transactions in all of a user's accounts
  def total_balance
    total = []
    self.accounts.each do |acc|
      bal = acc.actual_balance
      total.push(bal)
    end
    return helpers.number_to_currency(total.sum)
   end

   # sums up all transactions that have been marked 'cleared' in all of a user's accounts
  def cleared_balance
    total = []
    self.accounts.each do |acc|
      bal = acc.bank_balance
      total.push(bal)
    end
    return helpers.number_to_currency(total.sum)
  end

  # identifies the timestamp of the last update made to any of the user's transactions
  def last_txn_update
    if self.transactions.first.nil?
      return ''
    else
      last_update = self.transactions.order(:updated_at).last.updated_at
      return last_update.to_date.to_formatted_s(:long)
    end
  end

	private
		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
    end

end
