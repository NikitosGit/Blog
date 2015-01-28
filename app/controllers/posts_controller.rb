class PostsController < ApplicationController
	def index
		@post = Post.all
		#render "index"
	end


	def show
		@post = Post.where(id: params[:id]).first
		#render text: @post.map {|i| "#{i.id} #{i.title}: #{i.text}"}.join("<br/>")
		render "show"
	end


	def new
		@post = Post.new
	end


	def create
		@post = Post.create(post_params)
		if @post.errors.empty?
			redirect_to post_path(@post)
		else
			render "new"
		end
	end


	private 
		
	def post_params
		params.require(:post).permit(:title, :text)
	end
end
