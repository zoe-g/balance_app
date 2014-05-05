class User < ActiveRecord::Base
	has_many :accounts
	has_many :transactions, through: :accounts
end
