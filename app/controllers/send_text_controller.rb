class SendTextController < ApplicationController
	
	skip_before_action :verify_authenticity_token
	before_filter :signed_in_user

	def index
	end

	# sends a user their balance information via SMS through the Twilio API
	def balance_info
		twilio_sid = ENV['TWILIO_SID']
  	twilio_token = ENV['TWILIO_TOKEN']
  	from_number = ENV['TWILIO_PHONE_NUMBER']
    ## A reminder here to use the current user method
  	to_number = '+1'+@current_user.phone
  	to_name = @current_user.first_name.downcase
  	total_balance = @current_user.total_balance

  	message = "hey #{to_name}! according to your last updates on the balance app, you have #{total_balance} to your name."

		@client = Twilio::REST::Client.new twilio_sid, twilio_token 
		@client.account.messages.create({
			:from => from_number,
			:to => to_number, 
			:body => message 
		})

		flash[:notice]='check your phone!'
    redirect_to accounts_path
	end
 
 	# sends a user a reminder to log in after a period of inactivity (notification schedule not yet implemented)
 	def update_reminder
		twilio_sid = ENV['TWILIO_SID']
  	twilio_token = ENV['TWILIO_TOKEN']
  	from_number = ENV['TWILIO_PHONE_NUMBER']
  	to_number = '+1'+@current_user.phone

  	message = "hey, #{@current_user.first_name.downcase}. been a while since you tracked your expenses. got some time to check in at balanced.herokuapp.com?"

		@client = Twilio::REST::Client.new twilio_sid, twilio_token 
		@client.account.messages.create({
			:from => from_number,
			:to => to_number, 
			:body => message 
		})

  end

end
