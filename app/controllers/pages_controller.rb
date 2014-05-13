class PagesController < ApplicationController

	before_filter :signed_in_user
	before_filter :accounts_owned

	# HOME
	def home
		@user_accounts = @current_user.accounts
	end

end
