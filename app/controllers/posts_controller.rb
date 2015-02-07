class PostsController < ApplicationController
	def index
		@post = Post.all
		#render "index"
	end


	def show
		@post = Post.where(id: params[:id]).first
		#@comment = Comment.new
		#@comment.post = @post
		@comment = Comment.where(post_id: params[:id])

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

	def edit
		@post = Post.where(id: params[:id]).first
	end

	def update
		@post = Post.where(id: params[:id]).first
		@post.update_attributes(post_params);
		if @post.errors.empty?
			redirect_to post_path(@post)
		else
			redirect_to "edit"
		end
	end

	def destroy
		@post = Post.where(id: params[:id]).first
		@post.destroy
		redirect_to action: "index"
	end

	private 
		
	def post_params
		params.require(:post).permit(:title, :text)
	end
end
