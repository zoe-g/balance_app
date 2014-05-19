require 'spec_helper'

describe User do

  ## Good job here testing the phone number.  You could expand on the same sort of testing.  For example
  ## create a test that ensures the password must be at least 8 characters.
	describe 'phone' do

		it 'should have a phone number' do
			user = User.create(first_name: 'zoe', email_address: 'zoe@zoeg.co', password: 'password', password_confirmation: 'password')
			user.should_not be_valid
		end

		it 'should be 10-digits' do
			user = User.create(first_name: 'zoe', email_address: 'zoeg@zoeg.co', phone: '12345678', password: 'password', password_confirmation: 'password')
			user.should_not be_valid
		end

	end

end
