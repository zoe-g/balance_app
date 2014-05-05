class SpendCategory < ActiveRecord::Base
	has_many :transactions
end
