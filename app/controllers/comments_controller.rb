class CommentsController < ApplicationController

	http_basic_authenticate_with :name => "verapp", :password => "schluch", :only => :destroy

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(params[:comment])
		@comment.post = @post;
	    respond_to do |format|
			if @comment.save
				format.html {redirect_to @post, notice: 'Comment was succesfully created.'}
			else
				format.html {redirect_to @post, :flash => {:comment_errors => @comment.errors}}
			end
		end
	end
	
	def index
		@post = Post.find(params[:post_id])
		respond_to do |format|
			format.json {render json: @post.comments}
		end
	end
	
	def show
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment])
		respond_to do |format|
		  format.json { render json: @comment }
		end
	end
	
	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to @post
	end
end
