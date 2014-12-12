class ArticlesController < ApplicationController
	before_filter :signed_in_user?, except:[:index, :show]

	def index

		if params[:user_id]
			@user = User.find(params[:user_id])
			rel = @user.articles 
		else
			rel = Article
		end 
		@articles = rel.readable_for(current_user)
	end 

	def show
		@article = Article.readable_for(current_user).find(params[:id])
	end

	def new
		@article = Article.new
	end 

	def create
		@article = Article.new(params[:article])
		if @article.save
			redirect_to article_path(@article), notice: "Created"
		else
			render "new"
		end 
	end 

	def edit
	end 

	def update
	end 

	def destroy
	end 
end