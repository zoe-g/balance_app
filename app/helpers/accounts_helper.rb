module AccountsHelper

	def accounts_owned
		@user_accounts = @current_user.accounts.where(id: params[:id])
		
		if @user_accounts.nil?
			redirect_to new_account_path, notice: "you do not have any accounts yet. please create one to begin using the app."
		end
	end

end
