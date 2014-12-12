class SessionsController < ApplicationController

	def new
	end 

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in(user)
			redirect_to user_path(user)
		else
			flash[:error] = "Not Registerd"
			redirect_to root_path
		end 
	end 

	def destroy
		sign_out
	end 
end
