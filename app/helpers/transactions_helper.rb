module TransactionsHelper
	
  ## This helper will never redirect to new_transaction_path, no matter what
  ## id is sent as a the param.  The where method will return an array of
  ## results.  So even if you get back an empty array, it is still not nil. 
	def transactions_owned
    ## Make sure to use the current_user method defined in the session helper.
		@user_transactions = @current_user.transactions.where(id: params[:id])

		if @user_transactions.nil?
			redirect_to new_transaction_path, notice: "you do not have any transactions yet. now's a good time to add some!"
		end
		
	end

end
