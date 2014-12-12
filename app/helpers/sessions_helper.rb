module SessionsHelper
	
	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end 

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end 

	def current_user?(user)
		user == current_user
	end 

	def signed_in?
		!current_user.nil?
	end 

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
		redirect_to root_path		
	end 

	def signed_in_user?
		redirect_to new_session_path ,notice: "Please Sign_in" unless signed_in?
	end 


end 
