module TransactionsHelper
	
	def transactions_owned
		@user_transactions = @current_user.transactions.where(id: params[:id])

		if @user_transactions.nil?
			redirect_to new_transaction_path, notice: "you do not have any transactions yet. now's a good time to add some!"
		end
		
	end

end
