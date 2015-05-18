class SessionsController < ApplicationController

	def new
		@user
	end

	def create_fb
		user = User.from_omniauth(request.env['omniauth.auth'])
		session[:user_id] = user.id
		redirect_to index_path
	end

	# Method to log user in, will pass if user exists and password is correct
	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to index_path
		else
			# if user does not exist or password is incorrect, show error message
			flash[:alert] = "Incorrect email or password"
			redirect_to '/login'
		end
	end	

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end