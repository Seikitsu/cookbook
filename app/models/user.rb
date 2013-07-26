class User < ActiveRecord::Base
	before_save {self.email = email.downcase}
	has_many :posts
	validates :name, presence: true, length: {minimum: 3, maximum: 40}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, length: {minimum: 6}
end
