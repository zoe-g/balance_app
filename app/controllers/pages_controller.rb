class PagesController < ApplicationController
	include AccountsHelper

	before_filter :signed_in_user
	before_filter :accounts_owned

	# HOME
	def home
    ## You should always use the current_user method rather than accessing the @current_user
    ## instance variable directory.  There is always a chance that @current_user could be nil
    ## and you have to call the current_user method to get the user from the database.
		@user_accounts = @current_user.accounts
	end

end
