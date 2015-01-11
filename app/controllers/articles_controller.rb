class ArticlesController < ApplicationController
	before_filter :signed_in_user?, except:[:index, :show]

	def index
		if params[:user_id] 
			@user = User.find(params[:user_id])
			rel = @user.articles 
		  if current_user.id == params[:user_id]
		  	rel = current_user.articles
		  end 
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
		@article = current_user.articles.build(params[:article])
		if @article.save
			redirect_to user_articles_path(current_user), notice: "Created"
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