class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :account_type
  has_many :transactions
end
