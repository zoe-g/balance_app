module AccountsHelper

  ## This helper will never redirect to accounts_path, no matter what id is sent as a the param.
  ## The where method will return an array of results.  So even if you get back an empty array,
  ## it is still not nil. 
	def accounts_owned
    ## Make sure to use the current_user method defined in the session helper.
		@user_accounts = @current_user.accounts.where(id: params[:id])
		
		if @user_accounts.nil?
			redirect_to accounts_path, notice: "you do not have any active accounts yet. please activate one to begin using the app."
		end
	end

end
