module TransactionsHelper
	
	def transactions_owned
		user_transactions = @current_user.transactions.find(params[:id])
	end

end
