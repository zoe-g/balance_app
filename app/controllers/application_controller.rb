class ApplicationController < ActionController::Base
	include SessionsHelper
	include AccountsHelper
	include TransactionsHelper

  protect_from_forgery with: :exception
  
end
