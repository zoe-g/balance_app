class Account < ActiveRecord::Base

	validates :user_id, presence: true
	validates :account_type_id, presence: true

  belongs_to :user
  belongs_to :account_type
  has_many :transactions

end
