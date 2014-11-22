class UsersController < ApplicationController
	before_filter :signed_in_user?, only:[:show, :edit, :update]

	def index
		@users = User.order("created_at")
	end

	def new
		@user = User.new
	end 

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "welcome"
			sign_in(@user)
			redirect_to user_path(@user)
		else
			render action: "new"
		end 
	end 

	def show
		@user = User.find(params[:id])
	end 

	def update
	end 

	def edit
	end 

	def destroy
		
	end 
end
