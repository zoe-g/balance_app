class SendTextController < ApplicationController
	
	skip_before_action :verify_authenticity_token
	before_filter :signed_in_user

	def index
	end
 
 	def inactive_transactions
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

    redirect_to home_path

  end

 	def inactive_reconcile
		twilio_sid = ENV['TWILIO_SID']
  	twilio_token = ENV['TWILIO_TOKEN']
  	
  	from_number = ENV['TWILIO_PHONE_NUMBER']
  	to_number = '+1'+@current_user.phone
  	message = "hey, #{@current_user.first_name.downcase}. been a while since you balanced your records with your bank's. got some time to check in at balanced.herokuapp.com?"

		@client = Twilio::REST::Client.new twilio_sid, twilio_token 
 
		@client.account.messages.create({
			:from => from_number,
			:to => to_number, 
			:body => message 
		})

    redirect_to home_path

  end

end
