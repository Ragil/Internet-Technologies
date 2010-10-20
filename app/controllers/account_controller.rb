class AccountController < ApplicationController

	def login

		if session[:user_id] and session[:user_id] != "ANONYMOUS"
			redirect_to :action => 'myaccount'
		end

		if session[:user_id] != "ANONYMOUS"
			@welcomemgs = "Please login in with your username and password."
		else
			@welcomemgs = "Incorrect Username/Password. Please check CAPSLOCK or register."
			reset_session
		end
	end

	def authenticate

		@user = User.new(params[:userform]);
		valid_user = User.find(:first,:conditions => ["username = ? and password = ?", @user.username, @user.password])

		if valid_user
			session[:user_id] = valid_user.username
			session[:email] = valid_user.email
			redirect_to :action => 'myaccount'
		else
			session[:user_id] = "ANONYMOUS"
			redirect_to :action => 'login'
		end

	end

	def register

		@user = User.new(params[:userform]);

		if !@user.username.blank? and !@user.password.blank? and !@user.email.blank?
			if @user.save
				session[:user_id] = @user.username
				session[:email] = @user.email
				redirect_to :action => 'myaccount'
			end
		end

	end

	def myaccount

		if !session[:user_id] or session[:user_id] == "ANONYMOUS"
			redirect_to :action => 'login'
		else
			@user = User.find(:first,:conditions => ["username = ?", session[:user_id] ])
		end

	end

	def logout

		if session[:user_id]
			reset_session
			redirect_to :action => 'login'
		end

	end

end
