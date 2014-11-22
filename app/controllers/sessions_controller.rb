class SessionsController < ApplicationController

	def new
	end 

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && User.authenticate(user)
			sign_in(user)
		else
			flash[:error] = "Not Registerd"
			redirect_to root_path
		end 
	end 

	def destroy
		sign_out
	end 
end
