module AccountsHelper

	def accounts_owned
		@user_accounts = @current_user.accounts.where(id: params[:id])
		
		if @user_accounts.nil?
			redirect_to accounts_path, notice: "you do not have any active accounts yet. please activate one to begin using the app."
		end
	end

end
