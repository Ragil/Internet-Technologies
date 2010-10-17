class User < ActiveRecord::Base
	has_many:surveys

	validates_presence_of :username, :message => "Username cannot be empty."
	validates_uniqueness_of :username, :message => "Username already taken."
	validates_presence_of :password, :message => "Password cannot be empty."
	validates_length_of :password, :within => 6..20, :message => "Password length must be between 6-20 inclusive."
	validates_presence_of :email, :message => "Email cannot be empty."
	validates_uniqueness_of :email, :message => "Email already in use."
	
end
