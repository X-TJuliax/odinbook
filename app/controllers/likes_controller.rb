# app/controllers/likes_controller.rb
class LikesController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @post = Post.find(params[:post_id])
      @like = @post.likes.build(user: current_user)
  
      if @like.save
        redirect_to root_path, notice: 'You liked this post.'
      else
        redirect_to root_path, alert: 'Unable to like this post.'
      end
    end
  
    def destroy
      @post = Post.find(params[:post_id])
      @like = @post.likes.find_by(user: current_user)
  
      if @like.destroy
        redirect_to root_path, notice: 'You unliked this post.'
      else
        redirect_to root_path, alert: 'Unable to unlike this post.'
      end
    end
  end
  