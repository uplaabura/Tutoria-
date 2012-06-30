class SessionsController < ApplicationController

	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user_path(user)
		else
			flash[:error] = "email/password not match"
			redirect_to start_path
		end
	end
	
	def destroy
		sign_out
		redirect_to root_path
	end

end

#Why that I can only use "user" instead of "@user"?????