class User < ActiveRecord::Base
	has_secure_password

	before_save { |user| user.email_address = email.downcase }
  before_save :create_remember_token

  validates :first_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

	has_many :accounts
	has_many :transactions, through: :accounts

	private
		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
    end

end
