class PostsController < ApplicationController
    # before_action :authenticate_user!, only: [:create]
  
    def index
      @users = User.all
      @posts = Post.all
      @post = Post.new  # Initialize a new post for the form
    end
  
    def create
      if user_signed_in?
        @post = current_user.posts.build(post_params)
        if @post.save
          redirect_to root_path, notice: 'Post was successfully created.'
        else
          @posts = Post.all
          @users = User.all
          render :index
        end
      else
        flash[:alert] = 'You need to log in to create a post.'
        @users = User.all
        @posts = Post.all
        @post = Post.new
        render :index
      end
    end
  
    private
  
      def post_params
        params.require(:post).permit(:description)
      end
  end
  